# set some environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-beta"

export WORK="$HOME/Work"
export CONFIG="$XDG_CONFIG_HOME"
export SCRIPTS="$HOME/.local/bin/"

export GOPATH="$HOME/go"
export CARGOPATH="$HOME/.cargo"
export NIMBLEPATH="$HOME/.nimble"
export EMACSPATH="$HOME/.emacs.d"

export PATH="$PATH:$SCRIPTS/:$GOPATH/bin:$CARGOPATH/bin:$NIMBLEPATH/bin:$EMACSPATH/bin"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"

# autostart these
dxhd &
dunst &
nm-applet &
blueman-applet &
flameshot &
#picom -cC &
unclutter &
numlockx off &
wmname compiz &
feh --no-fehbg --bg-scale $HOME/Pictures/wallpapers/monitor_primary.jpg --bg-scale $HOME/Pictures/wallpapers/monitor_secondary.jpg
go run $SCRIPTS/statusbar.go &
exec nimdow
