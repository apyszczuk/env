#!/bin/bash

if [ "$UNITS" == "metric" ]; then
    BASE=1000
    SYMBOL_K=KB
    SYMBOL_M=MB
    SYMBOL_G=GB
else
    BASE=1024
    SYMBOL_K=KiB
    SYMBOL_M=MiB
    SYMBOL_G=GiB
fi

PREVIOUS_BYTES_FILE="/tmp/$IFNAME-$DIRECTION-bandwidth-usage-ap"
CURRENT_BYTES_FILE="/sys/class/net/$IFNAME/statistics/""$DIRECTION""_bytes"

# hopefully PREVIOUS_BYTES_FILE is cleared after reboot automatically
if [ ! -e "$PREVIOUS_BYTES_FILE" ]; then
    echo "0" > "$PREVIOUS_BYTES_FILE"
    exit 0
fi

PREVIOUS_BYTES=$(cat "$PREVIOUS_BYTES_FILE")
CURRENT_BYTES=$(cat "$CURRENT_BYTES_FILE")
echo "$CURRENT_BYTES" > "$PREVIOUS_BYTES_FILE"

DIFF_BYTES=$(echo $CURRENT_BYTES-$PREVIOUS_BYTES | bc)
CURRENT_BANDWIDTH_BYTES=$(echo "$DIFF_BYTES/$interval" | bc -l)

UNIT="$SYMBOL_K"
M_LIMIT=$(echo "$BASE^2" | bc)
DIVIDE="$BASE"
if [ "$DIFF_BYTES" -gt "$M_LIMIT" ]; then
    DIVIDE="$M_LIMIT"
    UNIT="$SYMBOL_M"
fi
CURRENT_BANDWIDTH_TO_OUTPUT=$(echo "$CURRENT_BANDWIDTH_BYTES/$DIVIDE" | bc -l)

TOTAL_BANDWIDTH_TO_OUTPUT=$(echo "$CURRENT_BYTES/$(echo $BASE^3 | bc)" | bc -l)
UNIT_TOTAL="$SYMBOL_G"

printf "$ICON %.2f%s/s|%.2f%s\n" $CURRENT_BANDWIDTH_TO_OUTPUT $UNIT $TOTAL_BANDWIDTH_TO_OUTPUT $UNIT_TOTAL
exit 0
