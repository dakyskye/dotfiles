# start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

rfunblockbluetooth() {
	sleep 5s
	rfkill unblock bluetooth
	dunstify -u low "rfkill has just unblocked bluetooth"
}

startcorectrl() {
	corectrl &
	sleep 3s
	xdotool windowclose $(xdotool search --class corectrl)
}

rfunblockbluetooth &
startcorectrl &
lxsession &
dunst &
nm-applet &
pasystray &
blueman-applet &
unclutter &
numlockx off &
flameshot &
randwallp &
dxhd &
dxhd -c $CONFIG/dxhd/nimdow.sh &
go run $SCRIPTS/statusbar.go &
mailspring -b &
exec nimdow
