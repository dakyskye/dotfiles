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

KERNEL_INSTALL_PATH="$(mktemp -d)"

mv_built_kernel(){
	EFI_PATH="/boot/EFI/gentoo"
	cd "$KERNEL_INSTALL_PATH"
	chmod 755 ./*
	K="$(basename ./vmlinuz-*)"
	C="$(basename ./config-*)"
	S="$(basename ./System.map-*)"
	for file in $K $C $S; do
		mv "$EFI_PATH/$file" "$EFI_PATH/$file.old" || true
	done
	mv ./* "$EFI_PATH/"
	cp "$EFI_PATH/$K" "$EFI_PATH/vmlinuz.efi"
}

mv_built_initramfs(){
	chmod 755 /boot/initramfs-efistub
	mv /boot/EFI/gentoo/{initramfs.img,initramfs.img.old} || true
	mv /boot/initramfs-efistub /boot/EFI/gentoo/initramfs.img
}

cd /usr/src/linux/
make -j12
INSTALL_PATH="$KERNEL_INSTALL_PATH" make install
mv_built_kernel
cd /usr/src/linux/
make modules_install
genkernel --install --kernel-config=/usr/src/linux/.config --initramfs-filename=initramfs-efistub initramfs
mv_built_initramfs
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
		rm -rf "$KERNEL_INSTALL_PATH"
		;;
esac
