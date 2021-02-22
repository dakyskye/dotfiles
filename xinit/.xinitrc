# start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# autostart these
lxsession &
dunst &
nm-applet &
blueman-applet &
unclutter &
numlockx off &
flameshot &
emacs --daemon &
randwallp &
dxhd &
go run $SCRIPTS/statusbar.go &
exec nimdow
