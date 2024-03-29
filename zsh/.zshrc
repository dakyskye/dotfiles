source ~/.profile


alias vim="/usr/local/bin/nvim_ostheme; nvim"
alias nvim="/usr/local/bin/nvim_ostheme; nvim"

alias ls="exa --color auto --group-directories-first"
alias la="exa -a --color auto --group-directories-first"
alias ll="exa -al --color auto --group-directories-first"
alias lg="exa -alg --color auto --group-directories-first"
alias lh="exa -alh --color auto --group-directories-first"
alias lgh="exa -algh --color auto --group-directories-first"
alias lt="exa -aT --color auto --group-directories-first -I .git"

alias rgf="rg --files --no-ignore | rg"
alias rgfh="rg --files --no-ignore --hidden | rg"

alias cputemp="sudo powermetrics -i 1 -n 1 --samplers smc | grep '^CPU die temperature'"
alias fanspeed="sudo powermetrics -i 1 -n 1 --samplers smc | grep ^Fan"


export HISTFILE=~/.zsh_history
export HISTSIZE=500000
export SAVEHIST=1000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY


source /usr/local/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

autoload -Uz compinit
compinit

eval "$(thefuck --alias)"
eval "$(starship init zsh)"

source "$HOME/.acme.sh/acme.sh.env"

# Docker & Kubernetes
source <(docker completion zsh)
source <(kubectl completion zsh)
source <(kompose completion zsh)
source <(helm completion zsh)
source <(telepresence completion zsh)

alias d="docker"
alias k="kubectl"

# Orbital specific
orbdockerbuild() {
	docker build --build-arg BUILD="$(git describe --always --tags --dirty)" "$@"
}

