echo 'PASSWORD' | sudo -S pacman -Sy &
dxhd &
dunst &
nm-applet &
flameshot &
#picom -cC &
unclutter &
numlockx on &
wmname compiz &
feh --no-fehbg --bg-scale $HOME/Pictures/wallpapers/monitor_primary.jpg --bg-scale $HOME/Pictures/wallpapers/monitor_secondary.jpg
go run $SCRIPTS/statusbar.go &
exec nimdow
