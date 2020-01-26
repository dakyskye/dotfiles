set -gx EDITOR vim
set -gx WORK $HOME/My-Workflow
set -gx TOOLS $HOME/Tools
set -gx GOPATH $HOME/go
set -gx CARGOPATH $HOME/.cargo
set -gx PATH $PATH $GOPATH/bin $CARGOPATH/bin $TOOLS/bin
