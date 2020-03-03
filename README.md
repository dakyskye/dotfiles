# .dotfiles

My personal dot files and configs (including Vim, Fish, i3-gaps, polybar, termite and so on)

## Installation guide

* git clone the repository (if you're going to use vim plugins, you might want to clone it recursively)
* cd into the folder
* copy configs from `.config/` to your `$HOME/.config` (`~/.config`) config directory
* if going to grab all the configs, have a look at **Notes** to see Vim plugins guide, then do: `cp -r .config/* $HOME/.config/`

## Notes

* rename/delete **/usr/bin/i3-migrate-config-to-v4** in order to get i3-wm work with sxhkd bindings
* after executing **./ensure_nvim_plugins.sh**, execute `cp -r .config/nvim $HOME/.config/`

