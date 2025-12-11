source ~/.profile


alias vim="$SCRIPTS/nvim_ostheme; nvim"
alias nvim="$SCRIPTS/nvim_ostheme; nvim"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias ls="eza --color auto --group-directories-first"
alias la="eza -a --color auto --group-directories-first"
alias ll="eza -al --color auto --group-directories-first"
alias lg="eza -alg --color auto --group-directories-first"
alias lh="eza -alh --color auto --group-directories-first"
alias lgh="eza -algh --color auto --group-directories-first"
alias lt="eza -aT --color auto --group-directories-first -I .git"

alias rgf="rg --files --no-ignore | rg"
alias rgfh="rg --files --no-ignore --hidden | rg"

rgd() {
	find . -maxdepth $1 ! -name ".*" | rg "${@:2}"
}

rgdh() {
	find . -maxdepth $1 | rg "${@:2}"
}

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



source /opt/homebrew/share/antigen/antigen.zsh


antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1


FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit

t() {
  tmux attach -t "$1" 2>/dev/null || tmux new -s "$1"
}

_t_complete() {
  local -a sessions
  sessions=(${(f)"$(tmux ls -F '#S' 2>/dev/null)"})

  (( ${#sessions} )) || return 1

  compadd -a sessions
}

compdef _t_complete t

#eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(gh completion -s zsh)"
#eval "$(gh copilot alias -- zsh)"
#eval "$(logcli --completion-script-zsh)"

#source "$HOME/.acme.sh/acme.sh.env"
#source <(temporal completion zsh)
source <(docker completion zsh)
#source <(kubectl completion zsh)
#source <(kompose completion zsh)
#source <(helm completion zsh)
#source <(telepresence completion zsh)

alias d="docker"
#alias k="kubectl"
