#!/bin/bash
# capture_screen.sh – capture DOS screen text, no timestamps,
#                     merge cumulative screens, skip duplicates.
# Usage: ./capture_screen.sh <api-token> [output-file]
# Ctrl+C flushes the last screen and exits cleanly.

TOKEN="$1"
OUTPUT_FILE="${2:-star_screens.txt}"
INTERVAL=${CAP_INTERVAL:-0.25}            # poll interval (s)
STABLE_REQUIRED=${CAP_STABLE:-3}            # stable polls before accepting a screen
FLUSH_IDLE=${CAP_FLUSH:-8}                  # idle polls before flushing buffer

if [ -z "$TOKEN" ]; then
    echo "Usage: $0 <api-token> [output-file]"
    exit 1
fi

PENDING=""
STABLE_COUNT=0
LAST_SEEN=""
BUFFER=""
IDLE_COUNT=0

clean_screen() {
    printf '%s' "$1" | awk '
        { sub(/[[:space:]]+$/, ""); line[NR] = $0 }
        END {
            last = NR
            while (last > 0 && line[last] == "") last--
            for (i = 1; i <= last; i++) print line[i]
        }'
}

write_screen() {
    local cleaned
    cleaned=$(clean_screen "$1")
    [ -z "$cleaned" ] && return
    {
        echo "$cleaned"
        echo
#        echo "------------------------------------------------------------"
#        echo
    } >> "$OUTPUT_FILE"
}

# True if every non-blank line of $1 appears in $2
is_subset() {
    local a="$1" b="$2"
    while IFS= read -r line; do
        [ -z "$line" ] && continue
        if ! printf '%s\n' "$b" | grep -Fxq -- "$line"; then
            return 1
        fi
    done <<< "$a"
    return 0
}

flush_buffer() {
    [ -n "$BUFFER" ] || return
    write_screen "$BUFFER"
    BUFFER=""
}

trap 'flush_buffer; echo; echo "Captured. Output: $OUTPUT_FILE"; exit 0' INT TERM

echo "Capturing to $OUTPUT_FILE (Ctrl+C to stop)"
: > "$OUTPUT_FILE"

while true; do
    TEXT=$(curl -s --max-time 5 -H "Authorization: Bearer $TOKEN" \
           ${API_BASE:-http://localhost:8386}/api/v1/video/text | jq -r '.text // empty' 2>/dev/null)
    CLEAN=$(clean_screen "$TEXT")

    if [ "$CLEAN" = "$PENDING" ]; then
        STABLE_COUNT=$((STABLE_COUNT + 1))
    else
        PENDING="$CLEAN"
        STABLE_COUNT=1
    fi

    if [ "$STABLE_COUNT" -ge "$STABLE_REQUIRED" ] \
       && [ "$CLEAN" != "$LAST_SEEN" ] \
       && [ -n "$CLEAN" ]; then

        LAST_SEEN="$CLEAN"

        if [ -z "$BUFFER" ]; then
            BUFFER="$CLEAN"
        elif is_subset "$BUFFER" "$CLEAN"; then
            BUFFER="$CLEAN"
        else
            flush_buffer
            BUFFER="$CLEAN"
        fi
        IDLE_COUNT=0
    else
        IDLE_COUNT=$((IDLE_COUNT + 1))
        if [ -n "$BUFFER" ] && [ "$IDLE_COUNT" -ge "$FLUSH_IDLE" ]; then
            flush_buffer
        fi
    fi

    sleep "$INTERVAL"
done
