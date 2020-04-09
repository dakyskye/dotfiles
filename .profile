# set some environment variables
export TERM="termite"
export EDITOR="nvim"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"

export DOTNET_CLI_TELEMERY_OUTPUT=1
export POWERSHELL_TELEMETRY_OPTOUT=1

export WORK="$HOME/My-Workflow"
export CONFIG="$HOME/.config"
export SCRIPTS="$CONFIG/scripts"
export TOOLS="$HOME/Tools"

export GOPATH="$HOME/go"
export CARGOPATH="$HOME/.cargo"
export YARNPKGPATH="$HOME/.yarn"
export RUBYGEMPATH="$HOME/.gem/ruby"
export DOTNETPATH="$HOME/.dotnet"
export COMPOSERPATH="$CONFIG/composer"

export PATH="$PATH:$SCRIPTS/:$GOPATH/bin:$CARGOPATH/bin:$YARNPKGPATH/bin:$RUBYGEMPATH/bin:$DOTNETTOLPATH/tools:$COMPOSERPATH/vendor"
