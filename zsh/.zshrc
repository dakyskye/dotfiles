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

alias cputemp="sudo powermetrics -i 1 -n 1 --samplers smc | grep '^CPU die temperature'"
alias fanspeed="sudo powermetrics -i 1 -n 1 --samplers smc | grep ^Fan"

eval "$(thefuck --alias)"
eval "$(starship init zsh)"

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY_TIME


source /usr/local/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

antigen apply


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
