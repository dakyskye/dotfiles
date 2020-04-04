set -gx TERM termite
set -gx EDITOR nvim

set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git  -g ""'
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

set -gx WORK $HOME/My-Workflow
set -gx CONFIG $HOME/.config
set -gx TOOLS $HOME/Tools

set -gx GOPATH $HOME/go
set -gx CARGOPATH $HOME/.cargo
set -gx RUBYGEMPATH $HOME/.gem/ruby/*
set -gx DOTNETTOOLPATH $HOME/.dotnet/tools
set -gx COMPOSERPATH $HOME/.config/composer/vendor

set -gx PATH $PATH $GOPATH/bin $CARGOPATH/bin $HOME/.yarn/bin $RUBYGEMPATH/bin $DOTNETTOOLPATH $CONFIG/scripts/ $COMPOSERPATH/bin $TOOLS/bin

