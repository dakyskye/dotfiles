# .dotfiles

My personal dot files and configs (including Vim, Fish, i3-gaps, polybar, termite and so on)

## Installation guide

* git clone the repository (if you're going to use vim plugins, you might want to clone it recursively)
* cd into the folder
* copy configs from `.config/` to your `$HOME/.config` (`~/.config`) config directory

## Notes

* rename/delete **/usr/bin/i3-migrate-config-to-v4** in order to get i3-wm work with sxhkd bindings
* if going to grab all the configs, do the first three steps of [Installation](https://github.com/dakyskye/.dotfiles/#installation-guide) and `cp -r .config/* $HOME/.config/`

## Docs

### keybindigs (sxhkd)

* general keybindings

Key | Descrition
:---: | :---:
super + Escape | reload the sxhkd config
super + Return | reload the sxhkd config
super + d | launch rofi
Print | launch neofetch
super + ctrl + {p,r} | systemctl poweroff/reboot
super + ctrl + {l,o} | lock screen or log the user out
super + ctrl + {d,n} | super + ctrl + {d,n}
super + shift + w | change the wallpaper

* i3 specific keybindings

Key | Description
:---: | :---:
super + shift + {c,r} | reload the i3 configuration file / restart i3 inplace
super + shift + q | kill the focused window
super + {h,j,k,l} | focus the window on the left/down/up/right
super + shift + {h,j,k,l} | move the focused window to left/down/up/right
super + {shift,ctrl} + s | move the focused window to the scratchpad
super + shift + {n,d,y} | change the focused window border
super + {shift + space,f,o} | make the focused window tiling/floating/fullscreen/sticky floating
super + space | focus a tiling/floating window
super + a | focuse the parent container
super + e | toggle the vertical/horizontal split
super + *n* (n = 0-9) | switch to the workspace number *n*
super + ctrl + *n* (n = 0-9) | switch to the workspace number *n*
super + w + {h,l} | switch to the next/previous workspace number
super + shift + *n* (n = 0-9) | move the focused container to the workspace number *n*
super + alt + *n* (n = 0-9) | move the focused container to the workspace number *n + 10*
super + alt + {h,j,k,l} | resize the window
