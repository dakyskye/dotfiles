export EDITOR="nvim"

export CONFIG="$HOME/.config"
export WORK="$HOME/Work"
export GOPATH="$HOME/go"
export SCRIPTS="$HOME/.scripts"

CARGOPATH="$HOME/.cargo"
#PYTHONSCRIPTS="$(python3 -m site --user-base)"
PIPXANDMORE="$HOME/.local"

export PATH="$GOPATH/bin:$CARGOPATH/bin:$PIPXANDMORE/bin:$SCRIPTS:$PATH"


eval "$(/opt/homebrew/bin/brew shellenv)"
