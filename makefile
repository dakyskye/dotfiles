default:
	@echo "hello! what are you going to install? just make <it>"
	@echo "alacritty"
	@echo "dunst"
	@echo "dxhd"
	@echo "emacs"
	@echo "fish"
	@echo "neofetch"
	@echo "nimdow"
	@echo "nvim"
	@echo "packages"
	@echo "pam"
	@echo "rofi"
	@echo "scripts"
	@echo "services"
	@echo "xinit"
	@echo "xorg"

.PHONY: alacritty dunst dxhd emacs fish neofetch nimdow nvim packages pam rofi scripts services xinit xorg

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

neofetch:
	-@mv ~/.config/{neofetch,neofetch.bak}
	@mkdir -p ~/.config/neofetch/
	@cp ./neofetch/config.conf ~/.config/neofetch/
	@echo "installed neofetch config"

nimdow:
	-mv ~/.config/{nimdow,nimdow.bak}
	@mkdir -p ~/.config/nimdow/
	@cp ./nimdow/config.toml ~/.config/nimdow/
	@echo "installed nimdow config"

nvim:
	-@mv ~/.config/{nvim,nvim.bak}
	-@mv ~/.config/{coc-settings.json,coc-settings.json.bak}
	@mkdir -p ~/.config/nvim
	@cp ./nvim/{init.vim,coc-settings.json} ~/.config/nvim
	@yarn global add neovim
	@pip install neovim --user
	@go get -u github.com/jstemmer/gotags
	@yarn global add git+https://github.com/Perlence/tstags.git
	@echo "installed nvom config"
	@echo "neovim will exit on the first run"
	@echo "run :PlugInstall on the second run"

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
