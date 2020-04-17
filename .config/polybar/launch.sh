#!/bin/sh

if [ -z "$1" ]; then
	echo "no bar given" >&2
	exit 1
fi

# terminate already running bar instances
killall -q polybar
wait $!

CURRENT="$(wmctrl -m | awk '{if ($1 == "Name:") { print $2 }}')"
if [ ! "$1" = "$CURRENT" ]; then
	echo "can't launch $1 bar, whilst your current WM is $CURRENT" >&2
	exit 1
fi

launch_bar() {
	polybar -c "$CONFIG"/polybar/config.ini -r "$1" &
}

case "$1" in
	i3)
		launch_bar i3
		;;
	bspwm)
		launch_bar bspwm
		;;
	*)
		echo "can't launch $1 bar, it's not defined in $(dirname "$0")/launch.sh"
		;;
esac
