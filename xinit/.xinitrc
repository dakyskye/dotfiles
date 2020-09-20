echo 'PASSWORD' | sudo -S pacman -Sy &
dxhd &
dunst &
nm-applet &
#picom -cC &
unclutter &
numlockx on &
wmname compiz &
feh --no-fehbg --bg-scale $HOME/Images/wallpapers/monitor_primary.jpg --bg-scale $HOME/Images/wallpapers/monitor_secondary.jpg
go run $SCRIPTS/statusbar.go &
nimdow > nimdow.logs
