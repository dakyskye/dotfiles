#!/bin/bash

set -e

echo 'are you 100% sure you want to do this? type "yes I want" in screaming snake case :)'
read -r ANS
case "$ANS" in
	YES_I_WANT)
		;;
	*)
		exit 1
		;;
esac

cd /usr/src/linux/
make -j12
make install
make modules_install
genkernel --install --kernel-config=/usr/src/linux/.config initramfs
emerge @module-rebuild


echo "it is recommended to reboot after rebuilding kernel, proceed? [y/N]"
read -r ANS
case "$ANS" in
	y|Y)
		echo "system will reboot in 3 seconds"
		sleep 3s
		reboot
		;;
	*)
		;;
esac
