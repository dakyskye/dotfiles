export EDITOR="nvim"

export CONFIG="$HOME/.config"
export WORK="$HOME/Work"
export GOPATH="$HOME/go"

CARGOPATH="$HOME/.cargo"
PYTHONSCRIPTS="$(python3 -m site --user-base)"

export PATH="$GOPATH/bin:$CARGOPATH/bin:$PYTHONSCRIPTS/bin:$PATH"

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git/'"
