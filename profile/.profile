export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-stable"
export MANPAGER="nvim -c 'set ft=man' -"

export WORK="$HOME/Work"
export CONFIG="$XDG_CONFIG_HOME"
export SCRIPTS="$HOME/.local/bin"

export GOPATH="$HOME/go"
export CARGOPATH="$HOME/.cargo"
export NIMBLEPATH="$HOME/.nimble"

export PATH="$PATH:$SCRIPTS:$GOPATH/bin:$CARGOPATH/bin:$NIMBLEPATH/bin"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -U -g ''"
export STARSHIP_CONFIG="$CONFIG/starship/config.toml"
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
