#!/usr/bin/env bash
# Watches power state and switches Hypridle config accordingly

CONFIG_DIR="$HOME/.config/hypr"
SERVICE_NAME="hypridle.service"

switch_mode() {
    local mode=$1
    echo "Switching Hypridle to $mode mode"
    systemctl --user stop hypridle.service
    hypridle --config "$CONFIG_DIR/hypridle-$mode.conf" &
}

current=""

while true; do
    # Detect power status (returns "on-line" or "off-line")
    state=$(cat /sys/class/power_supply/AC*/online 2>/dev/null | grep -q 1 && echo "ac" || echo "battery")

    if [[ "$state" != "$current" ]]; then
        switch_mode "$state"
        current="$state"
    fi

    sleep 10  # check every 10 s
done
