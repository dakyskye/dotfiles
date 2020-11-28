# set some environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export TERM="xterm-256color"
export EDITOR="nvim"
export BROWSER="firefox"

export WORK="$HOME/Work"
export CONFIG="$XDG_CONFIG_HOME"
export TOOLS="$HOME/Tools"
export SCRIPTS="$HOME/.local/bin/"

export GOPATH="$HOME/go"
export CARGOPATH="$HOME/.cargo"
export NIMBLEPATH="$HOME/.nimble"
export EMACSPATH="$HOME/.emacs.d"

export PATH="$PATH:$SCRIPTS/:$GOPATH/bin:$CARGOPATH/bin:$NIMBLEPATH/bin:$EMACSPATH/bin"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"
