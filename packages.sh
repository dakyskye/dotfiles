#!/bin/sh

NATIVES_COUNT=$(pacman -Qqtn | wc -l)
NATIVES_COUNT_WRITTEN=$(< .packages_pacman wc -l)

FOREIGNS_COUNT=$(pacman -Qqtm | sed '/^yay$/d' | wc -l)
FOREIGNS_COUNT_WRITTEN=$(< .packages_aur wc -l)

NATIVES_DIFF=$((NATIVES_COUNT-NATIVES_COUNT_WRITTEN))
FOREIGNS_DIFF=$((FOREIGNS_COUNT-FOREIGNS_COUNT_WRITTEN))

echo "[DATABASES] - [NATVIE]"
if [ "$NATIVES_DIFF" -eq 0 ]; then
	echo "perhaps there is no installed/removed package"
elif [ "$NATIVES_DIFF" -gt 0 ]; then
	echo "perhaps there are $NATIVES_DIFF new packages"
	echo "type \"yes\" to proceed to file write"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		pacman -Qqtn > .packages_pacman && echo "writen to .packages_pacman file"
	else
		echo "file has not been written"
	fi
elif [ "$NATIVES_DIFF" -lt 0 ]; then
	echo "perhaps there are $(echo "$NATIVES_DIFF" | sed 's/^\-//g') removed packages"
	echo "type \"yes\" to proceed to write file"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		pacman -Qqtn > .packages_pacman && echo "writen to .packages_pacman file"
	else
		echo "file has not been written"
	fi
fi

echo
echo "[DATABASES] - [FOREIGN]"
if [ "$FOREIGNS_DIFF" -eq 0 ]; then
	echo "perhaps there is no installed/removed package"
elif [ "$FOREIGNS_DIFF" -gt 0 ]; then
	echo "perhaps there are $FOREIGNS_DIFF new packages"
	echo "type \"yes\" to proceed to file write"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		pacman -Qqtm > .packages_aur && sed -i '/^yay$/d' .packages_aur && echo "writen to .packages_pacman file"
	else
		echo "file has not been written"
	fi
elif [ "$FOREIGNS_DIFF" -lt 0 ]; then
	echo "perhaps there are $(echo "$FOREIGNS_DIFF" | sed 's/^\-//g') removed packages"
	echo "type \"yes\" to proceed to file write"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		pacman -Qqtm > .packages_aur && sed -i '/^yay$/d' .packages_aur && echo "writen to .packages_pacman file"
	else
		echo "file has not been written"
	fi
fi
