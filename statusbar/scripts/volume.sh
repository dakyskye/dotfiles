#!/bin/bash

print_vol() {
	PA_SINK="$(pactl info | grep "Default Sink" | awk '{ print $3; }')"
	SINK_INFO="$(pactl list sinks | grep -m1 -A 8 $PA_SINK)"

	VOL="$(echo "$SINK_INFO" | grep "Volume:" | awk '{ print $5; }')"
	VOL=${VOL%?}
	[[ "$(echo "$SINK_INFO" | grep "Mute:" | awk '{ print $2; }')" = "yes" ]] && VOL="MUTED $VOL"

	echo "$VOL"
}

print_vol

pactl subscribe | while read -r LINE; do
	echo "$LINE" | grep -qv "client" && print_vol
done
