# start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# autostart these
lxsession &
pulseaudio -D &
dunst &
nm-applet &
blueman-applet &
unclutter &
numlockx off &
flameshot &
emacs --daemon &
feh --no-fehbg --bg-scale $HOME/Pictures/wallpapers/monitor_primary.jpg --bg-scale $HOME/Pictures/wallpapers/monitor_secondary.jpg
go run $SCRIPTS/statusbar.go &
dxhd &
exec nimdow
