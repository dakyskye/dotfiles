default:
	@echo "hello! what are you going to install? just make <it>"
	@echo "alacritty"
	@echo "dunst"
	@echo "dxhd"
	@echo "i3"
	@echo "neofetch"
	@echo "nvim"
	@echo "packages"
	@echo "polybar"
	@echo "profile"
	@echo "rofi"
	@echo "scripts"
	@echo "xorg"
	@echo "zsh"

.PHONY: alacritty dunst dxhd i3 neofetch nvim packages polybar profile rofi scripts zsh

alacritty:
	-@cp -r ~/.config/{alacritty,alacritty.bak}
	@mkdir ~/.config/alacritty
	@cp ./alacritty/alacritty.yml ~/.config/alacritty/
	@echo installed

dunst:
	-@cp -r ~/.config/{dunst,dunst.bak}
	@mkdir ~/.config/dunst
	@cp ./dunst/dunstrc ~/.config/dunst/
	@echo installed

dxhd:
	-@cp -r ~/.config/{dxhd,dxhd.bak}
	@mkdir ~/.config/dxhd
	@cp dxhd/{dxhd.sh,i3.sh} ~/.config/dxhd/
	@echo installed

i3:
	-@cp ~/.config/{i3,i3.bak}
	@mkdir ~/.config/i3
	@cp ./i3/config ~/.config/i3/
	@echo installed

neofetch:
	-@cp -r ~/.config/{neofetch,neofetch.bak}
	@mkdir ~/.config/neofetch/
	@cp ./neofetch/config.conf ~/.config/neofetch/
	@echo installed

nvim:
	-@cp -r ~/.config/{nvim,nvim.bak}
	@mkdir ~/.config/nvim
	@cp ./nvim/{init.vim,coc-settings.json} ~/.config/nvim
	@echo installed

packages:
	@pacman -Qqe > ~/packages.bak
	@bash -c "sudo pacman -S --needed - < ./packages/packages_native"
	@bash -c "yay -S --needed - < ./packages/packages_foreign"
	@echo installed

polybar:
	-@cp -r ~/.config/{polybar,polybar,bak}
	@mkdir ~/.config/polybar
	@cp ./polybar/{config.ini,launch.sh} ~/.config/polybar/
	@echo installed

profile:
	-@cp ~/{.profile,.profile.bak}
	@cp ./profile/.profile ~/
	@echo installed

rofi:
	-@cp ~/.config/{rofi,rofi.bak}
	@mkdir ~/.config/rofi
	@cp ./rofi/rofi.sh ~/.config/rofi/
	@~/.config/rofi/rofi.sh
	@echo installed

scripts:
	-@mkdir -p ~/.local/bin
	@cp -i ./scripts/* ~/.local/bin/
	@echo installed

xorg:
	-@sudo cp /etc/X11/xorg.conf.d/00-keyboard.{conf,conf.bak}
	-@sudo mkdir -p /etc/X11/xorg.conf.d/
	@sudo cp ./xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/
	@echo installed

zsh:
	-@cp ~/{.zshrc,.zshrc.bak}
	-@cp -r ~/.config/{oh-my-zsh,oh-my-zsh.bak}
	@curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=~/.config/oh-my-zsh sh
	-@mkdir -p ~/.config/oh-my-zsh/custom/
	@cp ./zsh/ohmyzsh.sh ~/.config/oh-my-zsh/custom/
	@~/.config/oh-my-zsh/custom/ohmyzsh.sh
	@echo installed