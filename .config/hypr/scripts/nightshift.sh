#!/bin/bash

FILTER="~/.config/hypr/shader/bluelight.frag"
CURRENT_SHADER=$(hyprctl getoption decoration:screen_shader | awk 'NR==1 {print $2}')

if [[ "$CURRENT_SHADER" == "$FILTER" ]]; then
    hyprctl keyword decoration:screen_shader ""
    dunstify "Night Shift" "Disabled"
else
    hyprctl keyword decoration:screen_shader "$FILTER"
    dunstify "Night Shift" "Enabled"
fi