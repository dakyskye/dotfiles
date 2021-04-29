export $(dbus-launch)

pulseaudio --start

setxkbmap -layout us,ge -variant qwerty -option grp:alt_shift_toggle
xrandr --output HDMI-A-0 --primary --mode 1920x1080 --rate 74.97

#randwallp &
feh --no-fehbg --bg-scale ~/Pictures/wallpapers/wallpaper.png

picom -cf --backend glx --blur-background-frame &

unclutter &

dxhd -b
dxhd -cb ~/.config/dxhd/nimdow.sh

starttrayapps() {
	nm-applet &
	sleep 0.5

	volumeicon &
	sleep 0.5

	blueman-applet &
	sleep 0.5

	flameshot &
}

starttrayapps &

go run $SCRIPTS/statusbar.go &

exec nimdow

# vim:ft=sh
