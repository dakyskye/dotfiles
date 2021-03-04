# start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

rfunblockbluetooth() {
	sleep 7s
	rfkill unblock bluetooth
	dunstify -u low "rfkill has just unblocked bluetooth"
}

rfunblockbluetooth &
lxsession &
dunst &
nm-applet &
blueman-applet &
unclutter &
numlockx off &
flameshot &
randwallp &
dxhd &
dxhd -c $CONFIG/dxhd/nimdow.sh &
go run $SCRIPTS/statusbar.go &
exec nimdow
