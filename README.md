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

## FAQ

### Why is there i3 mode bindings still?

* because i3 modes are amazing, can't be replaced with anything:

`super + Tab ; r + {h,j,k,l}` (sxhkd way) multiple times compared to `super + Tab ; r` once and `h,j,k,l` (i3 mode way) multiple times is a big waste of time
