#!/usr/bin/bash

MANDATORY=(
	base
	base-devel
	util-linux
	dhcpcd
	os-prober
	lvm2

	linux
	linux-firmware
	linux-headers

	grub
	efibootmgr
	amd-ucode

	xorg
	xorg-xinit

	paru-bin
)

GPU=(
	xf86-video-amdgpu
	xf86-video-vesa

	mesa
	lib32-mesa
	opencl-mesa
	libva-mesa-driver
	lib32-libva-mesa-driver
	mesa-vdpau
	lib32-mesa-vdpau
	libva-vdpau-driver
	libvdpau-va-gl

	amdvlk
	vulkan-radeon
	lib32-vulkan-radeon
	lib32-amdvlk
	vkd3d
	lib32-vkd3d

	libva-utils
	mesa-demos
	corectrl
)

MEDIA=(
	pulseaudio
	pulseaudio-alsa
	pulseaudio-bluetooth

	pamixer
	pulsemixer

	blueman
	bluez

	bluez-utils
	alsa-utils
	playerctl
	pavucontrol-qt
	pasystray

	mpv
	mpv-mpris
	vlc
	youtube-dl

	spotify
	spotify-tray-git
	spotifywm-git

	obs-studio
	obs-streamfx
	obs-v4l2sink
)

FONTS=(
	ttf-dejavu
	ttf-liberation
	ttf-ubuntu-font-family
	noto-fonts
	noto-fonts-emoji
	noto-fonts-extra
	ttf-ms-fonts

	otf-font-awesome
	ttf-font-awesome

	ttf-cascadia-code
	ttf-jetbrains-mono
	nerd-fonts-cascadia-code
	nerd-fonts-jetbrains-mono

	ttf-hanazono
)

TWM=(
	nimdow-bin

	picom
	xcompmgr

	gnome-keyring
	lxsession
	networkmanager
	network-manager-applet
	numlockx
	redshift
	unclutter
	dxhd-git

	hddtemp
	maim
	giph
	xkblayout-state-git
	libxft-bgra-git
	wmctrl
	wmname
	xclip

	flameshot
	i3lock
	feh
	dunst
	pcmanfm-qt
	peek
	rofi
	rofimoji
	ranger
	screenkey
	sxiv
)

TERMINAL=(
	kitty

	bash
	fish
	dash

	lazygit
	starship-bin
	exa
	bat
	tree
	neofetch
	pfetch
	pipes.sh
	lolcat
	cmatrix
	cowsay
	asciinema
	grabc

	htop
	hdparm
	smartmontools
	p7zip
	zip
	unzip
	unrar
	fzf
	ripgrep
	the_silver_searcher
	pwgen
	bc
)

PROGRAMS=(
	google-chrome

	bitwarden-cli

	discord
	slack-desktop
	telegram-desktop
	zoom

	speedcrunch
	hwinfo

	gimp
	qbittorrent
	mullvad-vpn-bin
	woeusb
	gparted

	aspell
)

PROGRAMMING=(
	go
	python
	nodejs
	rustup
	lua

	python-pip
	npm
	yarn
	choosenim

	rust-analyzer
	golangci-lint-bin
	vint
	write-good
	yamllint

	clang
	gcc

	jetbrains-toolbox
	visual-studio-code-bin
	neovim-nightly-bin

	git
	github-cli
	openssh
	make
	ctags
	gnu-netcat
	inotify-tools
	jq
	dialog
	shellcheck

	docker
	docker-compose
	google-cloud-sdk
	postman-bin
)

LIST="${MANDATORY[*]} ${GPU[*]} ${MEDIA[*]} ${FONTS[*]} ${TWM[*]} ${TERMINAL[*]} ${PROGRAMS[*]} ${PROGRAMMING[*]}"

paru -S --needed $(sed '/^#/d' <<< $LIST)

# other packages
# Taskfile
go get github.com/go-task/task/v3/cmd/task
