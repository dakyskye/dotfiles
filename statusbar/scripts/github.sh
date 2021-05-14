#!/bin/bash

while true; do
	UNREAD="$(gh api notifications | jq length)"
	[[ -z $LAST_COUNT ]] && LAST_COUNT=$UNREAD
	if [[ $UNREAD -gt $LAST_COUNT ]]; then
		DIFF=$((UNREAD-LAST_COUNT))
		case "$DIFF" in
			1)
				dunstify -a 'GitHub' "You've got an unread notification"
				;;
			*)
				dunstify -a 'GitHub' "You've got $DIFF unread notifications"
				;;
		esac
	fi
	LAST_COUNT=$UNREAD
	echo "${UNREAD}"
	sleep 12s
done
