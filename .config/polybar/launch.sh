#!/bin/sh

# Terminate already running bar instances
killall -q polybar
wait $!

# Launch Polybar
polybar -r top &
polybar -r bottom &
