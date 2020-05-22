# dakyskye/dotfiles/packages

* *packages_native* packages from the native databases
* *packages_foreign* packages from the foreign databases (AUR)

## usage

### saving installed packages

`./packages.sh` - will write to `packages_foreign` and `packages_native` files

### installing packages

* `pacman -S --needed - < packages_native`
* `yay -S --needed - < packages_foreign`
