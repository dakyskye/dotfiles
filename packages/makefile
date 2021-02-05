mandatory := base base-devel linux linux-firmware linux-headers util-linux grub efibootmgr amd-ucode dhcpcd xorg xorg-xinit paru-bin

gpuXf86 := xf86-video-amdgpu xf86-video-vesa
gpuMesa := mesa lib32-mesa opencl-mesa
gpuLibva := libva-mesa-driver lib32-libva-mesa-driver
gpuLibvdpau := mesa-vdpau lib32-mesa-vdpau libva-vdpau-driver libvdpau-va-gl
vpuVulkan := amdvlk vulkan-radeon lib32-vulkan-radeon lib32-amdvlk kvd3d lib32-vkd3d
gpuTools := mesa-demos corectrl
gpuAllPackages := $(gpuXf86) $(gpuMesa) $(gpuLibva) $(gpuLibvdpau) $(gpuVulkan) $(gpuTools)

mediaPulse := pulseaudio pulseaudio-alsa pulseaudio-bluetooth
mediaPulseTools := pamixer pulsemixer pulseeffects pasystray
mediaBluetooth := blueman bluez bluez-utils
mediaTools := alsa-utils playerctl pavucontrol-qt
mediaPlayers := mpv mpv-mpris vlc youtube-dl spotify spotify-tray-git spotifywm-git
mediaRecorders := obs-studio obs-streamfx obs-v4l2sink
mediaAllPackages := $(mediaPulse) $(mediaPulseTools) $(mediaBluetooth) $(mediaTools) $(mediaPlayers) $(mediaRecorders)

fontGeneral := ttf-dejavu ttf-liberation ttf-ubuntu-font-family noto-fonts noto-fonts-emoji noto-fonts-extra ttf-ms-fonts
fontAwesome := otf-font-awesome ttf-font-awesome
fontProgramming := ttf-cascadia-code ttf-jetbrains-mono
fontNerd := nerd-fonts-cascadia-code nerd-fonts-jetbrains-mono
fontJapanese := ttf-hanazono
fontAllPackages := $(fontGeneral) $(fontAwesome) $(fontProgramming) $(fontNerd) $(fontJapanese)

twmList := nimdow-bin
twmCompositors := picom xcompmgr
twmUtilities := gnome-keyring lxsession networkmanager network-manager-applet numlockx redshift unclutter dxhd-git
twmScriptUtilities := hddtemp maim giph xkblayout-state-git libxft-bgra-git wmctrl wmname xclip
twmPrograms := flameshot i3lock feh dunst pcmanfm-qt peek rofi rofimoji ranger screenkey sxiv
twmAllPackages := $(twmList) $(twmCompositors) $(twmUtilities) $(twmScriptUtilities) $(twmPrograms)

terminalPrograms := kitty
terminalShells := bash fish dash
terminalFun := starship-bin exa bat tree neofetch pfetch pipes.sh lolcat cmatrix cowsay
terminalUtilities := p7zip zip unzip unrar fzf ripgrep the_silver_searcher pwgen
terminalShellUtilities := gnu-netcat inotify-tools jq shellcheck dialog
terminalAllPackages := $(terminalPrograms) $(terminalShells) $(terminalFun) $(terminalUtilities) $(terminalShellUtilities)

programsBrowsing := google-chrome
programsCommunication := discord slack-desktop telegram-desktop weechat zoom
programsGraphics := gimp
programsMonitoringNHardware := htop hdparm smartmontools
programsVpn := openssh mullvad-vpn-bin
programsMisc := woeusb qbittorrent aspell
programsAllPackages := $(programsBrowsing) $(programsCommunication) $(programsGraphics) $(programsMonitoringNHardware) $(programsVpn) $(programsMisc)

progLangs := go python nodejs rustup lua
progLangTools := python-pip npm yarn rust-analyzer
progCompilers := clang gcc
progEditors := jetbrains-toolbox visual-studio-code-bin neovim emacs
progTools := git openssh make docker docker-compose google-cloud-sdk postman-bin
progAllPackages := $(progLangs) $(progLangTools) $(progCompilers) $(progEditors) $(progTools)

default:
	@echo "make all"
	@echo "make mandatory"
	@echo "make amdgpu"
	@echo "make media"
	@echo "make fonts"
	@echo "make twm"
	@echo "make terminal"
	@echo "make programs"
	@echo "make programming"

all: mandatory amdgpu media fonts twm terminal programs programming

mandatory:
	@paru -S --needed $(mandatory)

amdgpu: mandatory
	@paru -S --needed $(gpuAllPackages)

media: mandatory
	@paru -S --needed $(mediaAllPackages)

fonts: mandatory
	@paru -S --needed $(fontAllPackages)
	@sudo fc-cache -rf

twm: mandatory
	@paru -S --needed $(twmAllPackages)

terminal: mandatory
	@paru -S --needed $(terminalAllPackages)

programs: mandatory
	@paru -S --needed $(programsAllPackages)

programming: mandatory
	@paru -S --needed $(progAllPackages)
