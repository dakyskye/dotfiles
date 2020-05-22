# set some environment variables
export TERM="xterm-256color"
export EDITOR="nvim"
export BROWSER="google-chrome-stable"

export WORK="$HOME/My-Workflow"
export CONFIG="$HOME/.config"
export TOOLS="$HOME/Tools"
export SCRIPTS="$HOME/.local/bin/"

export GOPATH="$HOME/go"
export CARGOPATH="$HOME/.cargo"
export YARNPKGPATH="$HOME/.yarn"
export RUBYGEMPATH="$HOME/.gem/ruby"
export DOTNETPATH="$HOME/.dotnet"
export COMPOSERPATH="$CONFIG/composer"
export NIMBLEPATH="$HOME/.nimble"

export PATH="$PATH:$SCRIPTS/:$GOPATH/bin:$CARGOPATH/bin:$YARNPKGPATH/bin:$RUBYGEMPATH/bin:$DOTNETTOLPATH/tools:$COMPOSERPATH/vendor:$NIMBLEPATH/bin"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"

export DOTNET_CLI_TELEMERY_OUTPUT=1
export POWERSHELL_TELEMETRY_OPTOUT=1
