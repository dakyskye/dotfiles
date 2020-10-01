default:
	@echo "hello! what are you going to install? just make <it>"
	@echo "alacritty"
	@echo "dunst"
	@echo "dxhd"
	@echo "fonts"
	@echo "neofetch"
	@echo "nimdow"
	@echo "nvim"
	@echo "packages"
	@echo "profile"
	@echo "rofi"
	@echo "scripts"
	@echo "services"
	@echo "spicetify"
	@echo "xinit"
	@echo "xorg"
	@echo "zsh"

.PHONY: alacritty dunst dxhd fonts neofetch nimdow nvim packages profile rofi scripts services spicetify xinit xorg zsh

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

fonts:
	-@mv ~/.local/share/{fonts,fonts.bak}
	@mkdir -p ~/.local/share/fonts
	@./fonts/fonts.sh
	@echo "installed fonts"

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
	@bash -c "sudo pacman -S --needed - < ./packages/packages_native"
	@bash -c "yay -S --needed - < ./packages/packages_foreign"
	@echo "installed packages"

profile:
	-@mv ~/{.profile,.profile.bak}
	@cp ./profile/.profile ~/
	@echo "installed X profile"

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
	@mkdir -p ~/Images/screenshots
	@echo "installed scripts"

services:
	-@sudo mv /etc/systemd/system/{hddtemp.service,hddtemp.service.bak}
	-@sudo mv /etc/systemd/system/{ssdtemp.service,ssdtemp.service.bak}
	@sudo cp ./services/{hddtemp.service,ssdtemp.service} /etc/systemd/system/
	@sudo systemctl enable hddtemp --now
	@sudo systemctl enable ssdtemp --now
	@sudo systemctl enable NetworkManager --now
	@sudo systemctl enable libvirtd --now
	@echo "enabled services"

spicetify:
	@sudo chmod a+wr /opt/spotify
	@sudo chmod a+wr /opt/spotify/Apps -R
	@spicetify
	@spicetify backup apply enable-devtool
	@spicetify update
	@spicetify config color_scheme Dark
	@spicetify apply
	@echo "installed spicetify config"

xinit:
	-@mv ~/{.xinitrc,.xinitrc.bak}
	@cp ./xinit/.xinitrc ~/
	@./xinit/xinit.sh
	@echo "installed xinit config"

xorg:
	-@sudo mv /etc/X11/xorg.conf.{d,d.bak}
	-@sudo mkdir -p /etc/X11/xorg.conf.d/
	@sudo cp ./xorg/{00-keyboard,10-monitor}.conf /etc/X11/xorg.conf.d/
	@echo "installed Xorg config"

zsh:
	-@mv ~/{.zshrc,.zshrc.bak}
	-@mv ~/.config/{oh-my-zsh,oh-my-zsh.bak}
	@curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=~/.config/oh-my-zsh sh
	-@mkdir -p ~/.config/oh-my-zsh/custom/
	@cp ./zsh/ohmyzsh.sh ~/.config/oh-my-zsh/custom/
	@~/.config/oh-my-zsh/custom/ohmyzsh.sh
	@rm ~/.zshrc 2> /dev/null
	@cp ./zsh/.zshrc ~/
	@echo "installed zsh config"
