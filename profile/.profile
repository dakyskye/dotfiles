export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export IDE="code"
export TERMINAL="kitty"
export BROWSER="brave"

export WORK="$HOME/Work"
export CONFIG="$XDG_CONFIG_HOME"
export SCRIPTS="$HOME/.local/bin/"

export GOPATH="$HOME/go"
export CARGOPATH="$HOME/.cargo"

export PATH="$PATH:$SCRIPTS/:$GOPATH/bin:$CARGOPATH/bin"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"
