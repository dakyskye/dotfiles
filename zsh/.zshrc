source ~/.profile


alias vim="/usr/local/bin/nvim_ostheme; nvim"
alias nvim="/usr/local/bin/nvim_ostheme; nvim"

alias ls="exa --color always --group-directories-first"
alias la="exa -a --color always --group-directories-first"
alias ll="exa -al --color always --group-directories-first"
alias lg="exa -alg --color always --group-directories-first"
alias lh="exa -alh --color always --group-directories-first"
alias lgh="exa -algh --color always --group-directories-first"
alias lt="exa -aT --color always --group-directories-first -I .git"

eval "$(thefuck --alias)"
eval "$(oh-my-posh init zsh --config /usr/local/share/oh-my-posh/themes/velvet.omp.json)"

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
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

ses(){
	tmux new-session -A -s "$1"
}
