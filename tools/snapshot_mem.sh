#!/bin/bash
# snapshot_mem.sh — drive STAR.EXE entries, snapshot dseg at the Good Luck
# screen (still inside STAR.EXE, DS = dseg), save raw dumps + cpu state.
# Usage: ./snapshot_mem.sh [entries-file] [output-dir]
#
# For each entry: output/<slug>.bin (DS:0x0000-0x7E80 raw),
#                 output/<slug>.regs.json (cpu/state at snapshot time).
# Leaves STAR.EXE at C:\> between entries (types final Enter after dump).

set -u

APPIMAGE="${DOSBOX_APPIMAGE:-$HOME/Desktop/dosbox-automation-0.85.1-7567ec4-x86_64.AppImage}"
CONFIG_DIR="${DOSBOX_CONFIG_DIR:-$HOME/.config/dosbox-automation}"
TOKEN_FILE="$CONFIG_DIR/webserver/api_token"
API="${API_BASE:-http://localhost:8386}"
ENTRIES="${1:-tests/screen_test/entries.txt}"
OUTPUT_DIR="${2:-memdump}"
ENTRY_TIMEOUT=150

for bin in curl jq python3; do
    if ! command -v "$bin" >/dev/null 2>&1; then
        echo "ERROR: '$bin' is not installed."
        exit 1
    fi
done
if [ ! -f "$ENTRIES" ]; then
    echo "ERROR: entries file '$ENTRIES' not found"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"
rm -f "$TOKEN_FILE"

APPIMAGE_PID=""
CLEANED=0

cleanup() {
    [ "$CLEANED" = "1" ] && return
    CLEANED=1
    trap - INT TERM EXIT
    echo
    echo ">>> Shutting down (please wait)..."
    if [ -n "$APPIMAGE_PID" ] && kill -0 "$APPIMAGE_PID" 2>/dev/null; then
        kill -TERM -"$APPIMAGE_PID" 2>/dev/null
        sleep 1
        kill -KILL -"$APPIMAGE_PID" 2>/dev/null
    fi
    echo ">>> Done."
}
trap cleanup INT TERM EXIT

echo ">>> Starting dosbox-automation..."
setsid "$APPIMAGE" >/dev/null 2>&1 &
APPIMAGE_PID=$!
echo ">>> AppImage PID: $APPIMAGE_PID"

printf ">>> Waiting for token"
for i in $(seq 1 60); do
    [ -f "$TOKEN_FILE" ] && break
    printf "."
    sleep 1
done
echo
if [ ! -f "$TOKEN_FILE" ]; then
    echo "ERROR: token file never appeared at $TOKEN_FILE"
    exit 1
fi
TOKEN=$(cat "$TOKEN_FILE")
export TOKEN
echo ">>> Token loaded (${#TOKEN} chars)"

printf ">>> Waiting for API"
for i in $(seq 1 30); do
    if timeout 5 curl -s -H "Authorization: Bearer $TOKEN" \
         "$API/api/v1/video/text" >/dev/null 2>&1; then
        break
    fi
    printf "."
    sleep 1
done
echo
echo ">>> API ready."

api() { timeout 10 curl -s -H "Authorization: Bearer $TOKEN" "$@"; }

get_state() {
    local s
    s=$(api "$API/api/v1/script/status" | jq -r '.state // "unknown"' 2>/dev/null) || s="unknown"
    [ -z "$s" ] && s="unknown"
    printf '%s' "$s"
}

wait_for_prompt() {
    local tries=0
    while [ $tries -lt 20 ]; do
        local txt
        txt=$(api "$API/api/v1/video/text" | jq -r '.text // empty' 2>/dev/null)
        if printf '%s' "$txt" | grep -Eq 'C:\\?>'; then
            echo " (after ${tries}s)"
            return 0
        fi
        printf "."
        tries=$((tries+1))
        sleep 1
    done
    echo " (timeout after ${tries}s)"
    return 1
}

n=0
while IFS='|' read -r name bdate btime city || [ -n "${name:-}" ]; do
    name=$(printf '%s'  "$name"  | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    bdate=$(printf '%s' "$bdate" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    btime=$(printf '%s' "$btime" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    city=$(printf '%s'  "$city"  | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    [ -z "$name" ] && continue
    case "$name" in \#*) continue ;; esac

    n=$((n+1))
    slug=$(printf '%s' "$name" | tr ' ' '_' | tr -cd '[:alnum:]_-')
    [ -z "$slug" ] && slug="entry_$n"
    DUMPFILE="$OUTPUT_DIR/${slug}.bin"
    REGFILE="$OUTPUT_DIR/${slug}.regs.json"
    LUA="/tmp/star_mem_${slug}_$$.lua"
    SCRIPT_NAME="star_mem_${n}_$$"

    echo
    echo "================================================================"
    echo "=== [$n] $name | $bdate | $btime | city $city"
    echo "    dump        : $DUMPFILE"

    echo ">>> stopping any previous script"
    api -X POST "$API/api/v1/script/stop" >/dev/null 2>&1
    sleep 0.5

    # Lua driver: full input flow, then advance to the Good Luck screen and
    # HOLD there (program waits for Enter; dseg values persist). Report
    # readiness via dosbox.output so the host can snapshot live memory.
    cat > "$LUA" <<EOF
dosbox.wait_frames(30)
dosbox.type("STAR.EXE\n")
dosbox.wait_for_text("YOUR STARS", 3600)
dosbox.type("\n")
dosbox.wait_for_text("Name ?", 3600)
dosbox.type("$name\n")
dosbox.wait_for_text("Birth date", 3600)
dosbox.type("$bdate\n")
dosbox.wait_for_text("Birth time", 3600)
dosbox.type("$btime\n")
dosbox.wait_for_text("Closest city", 3600)
dosbox.type("$city\n")
dosbox.wait_frames(30)
dosbox.type("\n")
dosbox.wait_frames(90)
for i = 1, 40 do
    if dosbox.screen_match("Good Luck") then break end
    dosbox.type("\n")
    dosbox.wait_frames(90)
end
if dosbox.screen_match("Good Luck") then
    dosbox.output["ready"] = true
else
    dosbox.output["ready"] = false
end
EOF

    rm -f "$DUMPFILE" "$REGFILE"
    echo ">>> loading Lua script"
    LOAD_RESP=$(api -X POST -H "Content-Type: text/plain" \
        --data-binary "@$LUA" \
        "$API/api/v1/script/load?name=${SCRIPT_NAME}&debug=false")
    echo "    response: $(echo "$LOAD_RESP" | tr -d '\n')"

    echo ">>> starting Lua script"
    api -X POST "$API/api/v1/script/start" >/dev/null

    echo ">>> polling for Good Luck screen (timeout ${ENTRY_TIMEOUT}s)"
    SECONDS=0
    READY=""
    while [ $SECONDS -lt $ENTRY_TIMEOUT ]; do
        ST=$(api "$API/api/v1/script/status")
        STATE=$(echo "$ST" | jq -r '.state // "unknown"' 2>/dev/null || echo "unknown")
        READY=$(echo "$ST" | jq -r '.output.ready // empty' 2>/dev/null)
        if [ "$STATE" = "completed" ] || [ -n "$READY" ]; then
            echo "    state=$STATE ready=$READY (after ${SECONDS}s)"
            break
        fi
        sleep 2
    done
    rm -f "$LUA"

    if [ "$READY" != "true" ]; then
        echo "    WARNING: Good Luck screen not confirmed (ready=$READY state=$STATE); snapshotting anyway"
    fi

    # --- live snapshot: cpu state (for DS) + full dseg ---
    echo ">>> snapshotting cpu + dseg"
    api "$API/api/v1/cpu/state" > "$REGFILE" 2>/dev/null
    DS=$(jq -r '.registers.ds // empty' "$REGFILE" 2>/dev/null)
    echo "    DS = $DS"
    if api "$API/api/v1/memory/DS/0x0/0x7E80" -o "$DUMPFILE" 2>/dev/null; then
        BYTES=$(wc -c < "$DUMPFILE")
        echo "    saved: $DUMPFILE ($BYTES bytes)"
    else
        echo "    ERROR: dseg dump failed"
    fi

    # --- exit STAR.EXE back to C:\> for the next entry ---
    echo ">>> exiting to DOS prompt"
    api -X POST "$API/api/v1/script/stop" >/dev/null 2>&1
    sleep 0.5
    api -X POST -H "Content-Type: application/json" \
        --data-binary '{"text": "\n\n\n"}' \
        "$API/api/v1/input/type" >/dev/null 2>&1
    printf ">>> waiting for DOS prompt"
    wait_for_prompt || echo "    WARNING: prompt not detected, continuing anyway"
done < "$ENTRIES"

echo
echo ">>> All entries done. Dumps in: $OUTPUT_DIR/"
ls -1 "$OUTPUT_DIR/" 2>/dev/null
