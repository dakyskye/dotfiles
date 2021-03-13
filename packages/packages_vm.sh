#!/usr/bin/bash

source ./packages.sh noinstall

UNNECCESSARY=(
	os-prober
	lvm2
	linux-firmware

	xf86-video-amdgpu
	amdvlk
	vulkan-radeon
	lib32-vulkan-radeon
	lib32-amdvlk
	vkd3d
	lib32-vkd3d
	corectrl

	pulseaudio-bluetooth
	blueman
	bluez
	bluez-utils

	spotify
	spotify-tray-git
	spotifywm-git
	obs-studio
	obs-streamfx
	obs-v4l2sink

	redshift
	hddtemp
	hdparm
	smartmontools

	bitwarden-cli
	discord
	slack-desktop
	telegram-desktop
	zoom
	speedcrunch
	gimp
	qbittorrent
	mullvad-vpn-bin
	woeusb
	gparted

	jetbrains-toolbox
	github-cli
	docker
	docker-compose
	google-cloud-sdk
	postman-bin
)

ADDITIONAL=(
	open-vm-tools
	gtkmm3
	gtkmm
	gtk2
	xf86-input-vmmouse
	xf86-video-vmware
)

for i in "${!LIST[@]}"; do
	for package in ${UNNECCESSARY[*]}; do
		[[ "${LIST[$i]}" = "$package" ]] && LIST[$i]=""
	done
done

LIST=(${LIST[*]} ${ADDITIONAL[*]})

paru -S --needed $(sed '/^#/d' <<< "${LIST[*]}")
