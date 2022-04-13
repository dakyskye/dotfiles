export EDITOR="nvim"

export CONFIG="$HOME/.config/"
export WORK="$HOME/Work"
export GOPATH="$HOME/go"

PYTHONSCRIPTS="$(python3 -m site --user-base)"

export PATH="$PATH:$GOPATH/bin:$PYTHONSCRIPTS/bin"

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git/'"
