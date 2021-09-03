export $(dbus-launch)

pipewire &

/usr/libexec/gsd-xsettings &
themer
appthemer kitty nvim &

setxkbmap -layout us,ge -variant qwerty -option grp:alt_shift_toggle
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output HDMI-A-0 --primary --mode 1920x1080 ==rate 74.07 --pos 0x0 --rotate normal --output HDMI-A-1 --off --mode 1360x768 --pos 1920x156 --rotate normal --output DVI-D-0 --off

#randwallp &
feh --no-fehbg --bg-scale ~/Pictures/wallpapers/wallpaper.png

picom -cf --backend glx &

unclutter &

dxhd -b
dxhd -cb ~/.config/dxhd/nimdow.sh

starttrayapps() {
	nm-applet &
	sleep 0.5

	blueman-applet &
	sleep 0.5

	flameshot &
}

starttrayapps &

bash -c "cd $SCRIPTS/statusbar && python ./main.py" &

exec nimdow

# vim:ft=sh
