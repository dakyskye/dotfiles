#!/bin/sh

# terminate already running bar instances
killall -q polybar
wait $!

CURRENT="$(wmctrl -m | awk '{if ($1 == "Name:") { print tolower($2) }}')"

polybar -c "$CONFIG"/polybar/config.ini -r "$CURRENT"
