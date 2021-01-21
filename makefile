default:
	@echo "hello! what are you going to install? just make <it>"
	@echo "alacritty"
	@echo "dunst"
	@echo "dxhd"
	@echo "emacs"
	@echo "fish"
	@echo "kitty"
	@echo "neofetch"
	@echo "modules"
	@echo "nimdow"
	@echo "nvim"
	@echo "packages"
	@echo "pam"
	@echo "rofi"
	@echo "scripts"
	@echo "services"
	@echo "xinit"
	@echo "xorg"

.PHONY: alacritty dunst dxhd emacs fish kitty neofetch modules nimdow nvim packages pam rofi scripts services xinit xorg

alacritty:
	-@mv ~/.config/{alacritty,alacritty.bak}
	@mkdir -p ~/.config/alacritty
	@cp ./alacritty/alacritty.yml ~/.config/alacritty/
	@echo "installed alacritty config"

dunst:
	-@mv ~/.config/{dunst,dunst.bak}
	@mkdir -p ~/.config/dunst
	@cp ./dunst/dunstrc ~/.config/dunst/
	@echo "installed dunst config"

dxhd:
	-@mv ~/.config/{dxhd,dxhd.bak}
	@mkdir -p ~/.config/dxhd
	@cp dxhd/dxhd.sh ~/.config/dxhd/
	@echo "installed dxhd config"

emacs:
	@git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
	@~/.emacs.d/bin/doom install
	@cp ./emacs/{config.el,init.el} ~/.doom.d/
	@~/.emacs.d/bin/doom sync
	@echo "installed Doom emacs config"

fish:
	-@mv ~/.config/fish/{config.fish,config.fish.bak}
	@mkdir -p ~/.config/fish
	@cp ./fish/config.fish ~/.config/fish/
	@echo "installed fish config"

kitty:
	-@mv ~/.config/kitty/{kitty.conf,kitty.conf.bak}
	@mkdir -p ~/.config/kitty
	@cp ./kitty/kitty.conf ~/.config/kitty/
	@echo "installed kitty config"

neofetch:
	-@mv ~/.config/{neofetch,neofetch.bak}
	@mkdir -p ~/.config/neofetch/
	@cp ./neofetch/config.conf ~/.config/neofetch/
	@echo "installed neofetch config"

modules:
	-@sudo mv /etc/modprobe.d/{v4l2loopback.conf,v4l2loopback.conf.bak}
	@sudo mkdir -p /etc/{modprobe.d,modules-load.d}
	@sudo cp ./modules/{vboxdrv,v4l2loopback}.conf /etc/modules-load.d/
	@sudo cp ./modprobe/v4l2loopback.conf /etc/modprobe.d/
	@echo "installed modules"

nimdow:
	-@mv ~/.config/{nimdow,nimdow.bak}
	@mkdir -p ~/.config/nimdow/
	@cp ./nimdow/config.toml ~/.config/nimdow/
	@echo "installed nimdow config"

nvim:
	-@mv ~/.config/{nvim,nvim.bak}
	@mkdir -p ~/.config/nvim
	@cp ./nvim/init.vim ~/.config/nvim
	@yarn global add neovim
	@pip install neovim --user
	@echo "trying to open nvim"
	@nvim # it will exit
	@echo "installed nvim config"
	@echo "don't forget to run :PlugInstall"

packages:
	@pacman -Qqe > ~/packages.bak
	@bash -c "paru -S --needed - < ./packages/packages_native < ./packages/packages_foreign"
	@echo "installed packages"

pam:
	-@sudo mv /etc/pam.d/{login,login.bak}
	-@sudo mkdir -p /etc/pam.d/
	@sudo cp ./pam/login /etc/pam.d/login
	@echo "installed pam config"

rofi:
	-@mv ~/.config/{rofi,rofi.bak}
	@mkdir -p ~/.config/rofi
	@cp ./rofi/rofi.sh ~/.config/rofi/
	@~/.config/rofi/rofi.sh
	@rm -f ~/.config/rofi/rofi.sh
	@echo "installed rofi config"

scripts:
	-@mkdir -p ~/.local/bin
	@cp -i ./scripts/* ~/.local/bin/
	@rm -f ~/.local/bin/README.md
	@mkdir -p ~/Pictures/screenshots
	@echo "installed scripts"

services:
	-@sudo mv /etc/systemd/system/{hddtemp.service,hddtemp.service.bak}
	-@sudo mv /etc/systemd/system/{ssdtemp.service,ssdtemp.service.bak}
	-@sudo mv /etc/systemd/system/{pacup.service,pacup.service.bak}
	@sudo cp ./services/{hddtemp.service,ssdtemp.service,pacup.service} /etc/systemd/system/
	@sudo systemctl enable hddtemp --now
	@sudo systemctl enable ssdtemp --now
	@sudo systemctl enable pacup
	@sudo systemctl enable NetworkManager --now
	@sudo systemctl enable libvirtd --now
	@sudo systemctl enable bluetooth --now
	@sudo systemctl enable avahi-daemon --now
	@echo "enabled services"

xinit:
	-@mv ~/{.xinitrc,.xinitrc.bak}
	@cp ./xinit/.xinitrc ~/
	@echo "installed xinit config"

xorg:
	-@sudo mv /etc/X11/xorg.conf.{d,d.bak}
	-@sudo mkdir -p /etc/X11/xorg.conf.d/
	@sudo cp ./xorg/{00-keyboard,10-monitor}.conf /etc/X11/xorg.conf.d/
	@echo "installed Xorg config"
