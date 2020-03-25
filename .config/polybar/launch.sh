#!/bin/sh

# Terminate already running bar instances
killall -q polybar
wait $!

# Launch Polybar
# current
polybar -c ~/.config/polybar/config.ini -r mainbar &
