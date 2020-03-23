#!/bin/sh

# Terminate already running bar instances
killall -q polybar
wait $!

# Launch Polybar
# current
polybar -r mainbar &
# old
#polybar -c $HOME/.config/polybar/old -r top &
#polybar -c $HOME/.config/polybar/old -r bottom &
