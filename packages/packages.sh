#!/bin/sh

NATIVES_COUNT=$(pacman -Qqen | wc -l)
NATIVES_COUNT_WRITTEN=$(< packages_native wc -l)

FOREIGNS_COUNT=$(pacman -Qqem | wc -l)
FOREIGNS_COUNT_WRITTEN=$(< packages_foreign wc -l)

NATIVES_DIFF=$((NATIVES_COUNT-NATIVES_COUNT_WRITTEN))
FOREIGNS_DIFF=$((FOREIGNS_COUNT-FOREIGNS_COUNT_WRITTEN))

write_packages() {
	if [ -z "$1" ]; then
		return 1;
	fi

	if [ "$1" = "native" ]; then
		pacman -Qqen > packages_native && echo "written to packages_native file"
	elif [ "$1" = "foreign" ]; then
		pacman -Qqem > packages_foreign && echo "written to packages_foreign file"
	fi
}

echo "[DATABASES] - [NATIVE]"
if [ "$NATIVES_DIFF" -eq 0 ]; then
	echo "perhaps there is no installed/removed package"
elif [ "$NATIVES_DIFF" -gt 0 ]; then
	echo "perhaps there are $NATIVES_DIFF new packages"
	echo "type \"yes\" to proceed to file write"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		write_packages native
	else
		echo "file has not been written"
	fi
elif [ "$NATIVES_DIFF" -lt 0 ]; then
	echo "perhaps there are $(echo "$NATIVES_DIFF" | sed 's/^\-//g') removed packages"
	echo "type \"yes\" to proceed to write file"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		write_packages native
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
		write_packages foreign
	else
		echo "file has not been written"
	fi
elif [ "$FOREIGNS_DIFF" -lt 0 ]; then
	echo "perhaps there are $(echo "$FOREIGNS_DIFF" | sed 's/^\-//g') removed packages"
	echo "type \"yes\" to proceed to file write"
	read -r ANS
	if [ "$ANS" = "yes" ]; then
		write_packages foreign
	else
		echo "file has not been written"
	fi
fi
