# .dotfiles

My personal dot files and configs (including Vim, Fish, i3-gaps, polybar, termite and so on)

## Installation guide

* git clone the repository (if you're going to use vim plugins, you might want to clone it recursively)
* cd into the folder
* run `./ensure_some_dependencies.sh`
* copy configs from `.config/` to your `$HOME/.config` (`~/.config`) config directory

## Notes

* rename/delete **/usr/bin/i3-migrate-config-to-v4** in order to get i3-wm work with sxhkd bindings
* if going to grab all the configs, do the first three steps of [Installation](https://github.com/dakyskye/.dotfiles/#installation-guide) and `cp -r .config/* $HOME/.config/`

## Docs

### keybindigs (sxhkd)

* general keybindings

Key | Behaviour
:---: | :---:
super + @Escape | reloads [sxhkd](https://github.com/baskerville/sxhkd) config
super + Return | launches [termite](https://github.com/thestinger/termite) terminal
super + d | launches [rofi](https://github.com/davatorium/rofi)
Print | launches [flameshot](https://github.com/lupoDharkael/flameshot)
[super + shift + v](https://github.com/dakyskye/.dotfiles/blob/master/.config/scripts/vim_plugins.py) | lists enabled and disabled [Vim](https://www.vim.org/) plugins
[super + shift + w](https://github.com/dakyskye/.dotfiles/blob/master/.config/scripts/wallpapers.go) | sets a random wallpaper

* i3 specific keybindings

Key | Behaviour
:---: | :---:
super + shift + q | kills the focused window
super + {h,j,k,l} | changes the focus to the left/bottom/top/right window
super + shift + {h,j,k,l} | moves the focused window to left/bottom/top/right
super + shift + {n,d,y} | changes the window border to none/normal/two pixels
super + {h,v} | splits in the horizontal/vertical orientation
super + {s,w,e} | changes the container layout to stacked/tabbed/splitted
super + {shift + space,space,f,o} | togless window tiling/floating/fulslcreen/sticky
super + {ctrl,shift} + s | hides/displays a (hidden) window
super + a | focusses the parent container
super + *n* (n = 0-9) | switches to workspace number *n*
super + ctrl + *n* (n = 0-9) | switches to workspace number *n*
super + ctrl + {h,l} | switches to previous/next workspace
super + shift + *n* (n = 0-9) | moves the focused container to workspace number ((**x** = *n*)) (*x* = 1-10)
super + shift + ctrl + *n* (n = 0-9) | moves the focused container to workspace number ((**x** =* n*)) (x= 11-20)
super + shift + {c,r} | reloads i3 config/restarts i3
super + Tab ; {r,s,w} | enters resize/system operations/screen warmness modes

## FAQ

### Why is there i3 mode bindings still?

* because i3 modes are amazing, can't be replaced with anything:

`super + Tab ; r + {h,j,k,l}` (sxhkd way) multiple times compared to `super + Tab ; r` once and `h,j,k,l` (i3 mode way) multiple times is a big waste of time
