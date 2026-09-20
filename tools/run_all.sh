#!/bin/bash
# run_all.sh — automate multiple STAR.EXE runs, one output file per entry.
# Usage: ./run_all.sh [entries-file] [output-dir]
#
# ⚠️  Do NOT press Ctrl+C while this is running. It will finish on its own.
#     The quiet pauses are normal; if you see dots, it is alive.

set -u

# -------- config --------
APPIMAGE="${DOSBOX_APPIMAGE:-$HOME/Desktop/dosbox-automation-0.85.1-7567ec4-x86_64.AppImage}"
CONFIG_DIR="${DOSBOX_CONFIG_DIR:-$HOME/.config/dosbox-automation}"
TOKEN_FILE="$CONFIG_DIR/webserver/api_token"
API="${API_BASE:-http://localhost:8386}"
ENTRIES="${1:-tests/screen_test/entries.txt}"
OUTPUT_DIR="${2:-output}"
CAPTURE_SCRIPT="$(dirname "$0")/capture_screen.sh"
LUA_WAIT=${LUA_WAIT:-90}        # frames between Enters (90 default; 30 for fuzz)
ENTRY_TIMEOUT=${ENTRY_TIMEOUT:-90}   # max seconds to wait for one entry (override for fuzz)

# -------- prerequisites --------
for bin in curl jq; do
    if ! command -v "$bin" >/dev/null 2>&1; then
        echo "ERROR: '$bin' is not installed. Run: sudo apt install $bin"
        exit 1
    fi
done
if [ ! -x "$CAPTURE_SCRIPT" ]; then
    echo "ERROR: $CAPTURE_SCRIPT not found or not executable"
    exit 1
fi
if [ ! -f "$ENTRIES" ]; then
    echo "ERROR: entries file '$ENTRIES' not found"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"
rm -f "$TOKEN_FILE"

APPIMAGE_PID=""
CAP_PID=""
CLEANED=0

cleanup() {
    [ "$CLEANED" = "1" ] && return
    CLEANED=1
    trap - INT TERM EXIT          # ignore further signals while cleaning up

    echo
    echo ">>> Shutting down (please wait)..."

    if [ -n "$CAP_PID" ] && kill -0 "$CAP_PID" 2>/dev/null; then
        kill -INT "$CAP_PID" 2>/dev/null
        wait "$CAP_PID" 2>/dev/null
    fi
    if [ -n "$APPIMAGE_PID" ] && kill -0 "$APPIMAGE_PID" 2>/dev/null; then
        kill -TERM -"$APPIMAGE_PID" 2>/dev/null
        sleep 1
        kill -KILL -"$APPIMAGE_PID" 2>/dev/null
    fi
    echo ">>> Done."
}
trap cleanup INT TERM EXIT

# -------- start AppImage --------
echo ">>> Starting dosbox-automation..."
setsid "$APPIMAGE" >/dev/null 2>&1 &
APPIMAGE_PID=$!
echo ">>> AppImage PID: $APPIMAGE_PID"

# -------- wait for token --------
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

# -------- wait for API --------
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

# -------- helpers --------
api() { timeout 5 curl -s -H "Authorization: Bearer $TOKEN" "$@"; }

get_state() {
    local s
    s=$(api "$API/api/v1/script/status" | jq -r '.state // "unknown"' 2>/dev/null) || s="unknown"
    [ -z "$s" ] && s="unknown"
    printf '%s' "$s"
}

# Prints a dot each second, returns 0 when C:\> is on screen, 1 on timeout.
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

# -------- main loop --------
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
    OUTFILE="$OUTPUT_DIR/${slug}.txt"
    LUA="/tmp/star_${slug}_$$.lua"
    SCRIPT_NAME="star_run_${n}_$$"

    echo
    echo "================================================================"
    echo "=== [$n] $name | $bdate | $btime | city $city"
    echo "    output      : $OUTFILE"
    echo "    script name : $SCRIPT_NAME"

    # --- stop previous script ---
    echo ">>> stopping any previous script"
    api -X POST "$API/api/v1/script/stop" >/dev/null 2>&1
    sleep 0.5

    # --- generate Lua driver for this entry ---
    cat > "$LUA" <<EOF
-- Wait for a live DOS prompt before touching the keyboard (boot race)
dosbox.wait_for_text("C:", 3600)
dosbox.wait_frames(30)

-- Launch STAR.EXE
dosbox.type("STAR.EXE\n")

-- Wait until the first screen actually appears (generous: disk load varies)
dosbox.wait_for_text("YOUR STARS", 600)

-- Answer the Y/N prompt (default N)
dosbox.type("\n")

-- Wait for the Name prompt, then fill it in
dosbox.wait_for_text("Name ?", 600)
dosbox.type("$name\n")

-- Wait for the birth date prompt
dosbox.wait_for_text("Birth date", 600)
dosbox.type("$bdate\n")

-- Wait for the birth time prompt
dosbox.wait_for_text("Birth time", 600)
dosbox.type("$btime\n")

-- Wait for the city prompt
dosbox.wait_for_text("Closest city", 600)
dosbox.type("$city\n")

-- Next screen: SAYANA / NRAYANA method (default N)
dosbox.wait_frames(30)
dosbox.type("\n")
dosbox.wait_frames($LUA_WAIT)
-- Remaining screens advance on Enter
for i = 1, 25 do
    dosbox.wait_frames($LUA_WAIT)
    dosbox.type("\n")
end
EOF

    # --- start capture in background ---
    rm -f "$OUTFILE"
    echo ">>> starting capture → $OUTFILE"
    "$CAPTURE_SCRIPT" "$TOKEN" "$OUTFILE" >/dev/null 2>&1 &
    CAP_PID=$!
    sleep 1

    # --- load and start Lua ---
    echo ">>> loading Lua script"
    LOAD_RESP=$(api -X POST -H "Content-Type: text/plain" \
        --data-binary "@$LUA" \
        "$API/api/v1/script/load?name=${SCRIPT_NAME}&debug=false")
    echo "    response: $(echo "$LOAD_RESP" | tr -d '\n')"

    echo ">>> starting Lua script"
    api -X POST "$API/api/v1/script/start" >/dev/null
    sleep 3  # let load/start settle (avoids transitional empty status)

    # --- poll with visible progress ---
    echo ">>> polling (timeout ${ENTRY_TIMEOUT}s; do NOT press Ctrl+C)"
    SECONDS=0
    LAST_STATE=""
    EMPTY_HITS=0
    while [ $SECONDS -lt $ENTRY_TIMEOUT ]; do
        STATE=$(get_state)
        if [ -z "$STATE" ]; then
            # transitional empty response (whitespace-only body): retry, don't abort
            EMPTY_HITS=$((EMPTY_HITS+1))
            if [ "$EMPTY_HITS" -gt 10 ]; then
                echo "    WARNING: status empty ${EMPTY_HITS}x, continuing to wait"
                EMPTY_HITS=0
            fi
            sleep 2
            continue
        fi
        if [ "$STATE" != "$LAST_STATE" ]; then
            echo "    [${SECONDS}s] state = $STATE"
            LAST_STATE="$STATE"
        fi
        case "$STATE" in
            running|yielded|loaded|unknown) ;;
            *) break ;;
        esac
        sleep 2
    done
    echo "    final state = $STATE  (after ${SECONDS}s)"

    # --- stop capture, wait for it to flush ---
    echo ">>> stopping capture (flushing final screen)"
    sleep 2
    if [ -n "$CAP_PID" ] && kill -0 "$CAP_PID" 2>/dev/null; then
        kill -INT "$CAP_PID" 2>/dev/null
        printf "    waiting for capture to exit"
        for i in $(seq 1 10); do
            kill -0 "$CAP_PID" 2>/dev/null || break
            printf "."
            sleep 1
        done
        kill -KILL "$CAP_PID" 2>/dev/null
        wait "$CAP_PID" 2>/dev/null
        echo
    fi
    CAP_PID=""
    rm -f "$LUA"

    LINES=0
    [ -f "$OUTFILE" ] && LINES=$(wc -l < "$OUTFILE")
    echo "    saved: $OUTFILE ($LINES lines)"

    # --- wait for DOS prompt before next entry ---
    printf ">>> waiting for DOS prompt"
    wait_for_prompt || echo "    WARNING: prompt not detected, continuing anyway"
done < "$ENTRIES"

echo
echo ">>> All entries done. Output in: $OUTPUT_DIR/"
ls -1 "$OUTPUT_DIR/" 2>/dev/null
