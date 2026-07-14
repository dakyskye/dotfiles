# ~/.bashrc — bash 5.3 (homebrew) port of ~/.zshrc
# Interactive niceties come from ble.sh (autosuggestions + syntax highlight + vi-mode).
#
# One-time setup:
#   brew install bash-completion@2 gawk
#   # ble.sh isn't in homebrew — build from source into ~/.local:
#   git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git /tmp/ble.sh
#   make -C /tmp/ble.sh install PREFIX="$HOME/.local"
#   # make homebrew bash a login shell:
#   echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
#   chsh -s /opt/homebrew/bin/bash

# ble.sh must be sourced near the TOP, only in interactive shells, and attached at the bottom.
# Gives you: autosuggestions, syntax highlighting, and real vim mode (incl. iw/aw
# text objects — diw/ciw/viw — which readline's builtin vi-mode lacks).
[[ $- == *i* ]] && [[ -r ~/.local/share/blesh/ble.sh ]] \
    && source ~/.local/share/blesh/ble.sh --noattach

source ~/.profile


alias vim="nvim"
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

# ${@:2} slicing works identically in bash 5
rgd() {
	find . -maxdepth "$1" ! -name ".*" | rg "${@:2}"
}

rgdh() {
	find . -maxdepth "$1" | rg "${@:2}"
}

alias cputemp="sudo powermetrics -i 1 -n 1 --samplers smc | grep '^CPU die temperature'"
alias fanspeed="sudo powermetrics -i 1 -n 1 --samplers smc | grep ^Fan"


# --- history ---------------------------------------------------------------
# zsh setopt -> bash equivalents
export HISTFILE=~/.bash_history          # separate from ~/.zsh_history on purpose
export HISTSIZE=500000                    # in-memory (== zsh HISTSIZE)
export HISTFILESIZE=1000000               # on-disk  (== zsh SAVEHIST)
export HISTCONTROL=ignoreboth:erasedups   # HIST_IGNORE_DUPS + HIST_IGNORE_SPACE + expire-dups-first (approx)
shopt -s histappend                       # don't clobber history file
shopt -s histverify                       # HIST_VERIFY: edit recalled history line before running
# SHARE_HISTORY: flush after each command and pull in new lines from other shells
PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND:-}"


# --- vi mode + history search ----------------------------------------------
set -o vi   # ble.sh picks this up and uses its (full) vi keymap
# `v` in vi command-mode opens the current line in $VISUAL — your zsh `vv`-into-nvim.
export VISUAL="${VISUAL:-nvim}"
export EDITOR="${EDITOR:-nvim}"

# Up/Down -> true substring history search, 1-1 with zsh-history-substring-search.
# ble-bind under ble.sh; plain readline prefix-search as a fallback otherwise.
if [[ ${BLE_VERSION-} ]]; then
    # bash already prints "command not found"; drop ble.sh's extra "[ble: exit N]" line
    bleopt exec_errexit_mark=

    # no as-you-type gray autosuggestion (it happily suggested huge multiline blobs).
    # Tab still completes normally.
    bleopt complete_auto_complete=

    ble-bind -m vi_imap -f 'up'   'history-substring-search-backward'
    ble-bind -m vi_imap -f 'down' 'history-substring-search-forward'
    ble-bind -m vi_nmap -f 'up'   'history-substring-search-backward'
    ble-bind -m vi_nmap -f 'down' 'history-substring-search-forward'

    # Ctrl-C aborts the current line (like plain bash) instead of ble.sh's exit prompt
    ble-bind -m vi_imap -f 'C-c' discard-line
    ble-bind -m vi_nmap -f 'C-c' discard-line

    # vv -> edit line in nvim and run it on :wq: v enters visual (instant),
    # a 2nd v opens $VISUAL and executes the edited command on save.
    ble-bind -m vi_xmap -f 'v' 'edit-and-execute-command'

    # TODO: shrink the Esc (insert->normal) switch delay — find the right bleopt later
else
    bind '"\e[A": history-search-backward' 2>/dev/null
    bind '"\e[B": history-search-forward'  2>/dev/null
fi


# --- completion ------------------------------------------------------------
# bash-completion@2 replaces zsh's compinit/FPATH machinery
[[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]] \
    && source /opt/homebrew/etc/profile.d/bash_completion.sh

t() {
  tmux attach -t "$1" 2>/dev/null || tmux new -s "$1"
}

# bash port of the zsh _t_complete/compdef pair
_t_complete() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local sessions
  sessions=$(tmux ls -F '#S' 2>/dev/null) || return
  COMPREPLY=( $(compgen -W "$sessions" -- "$cur") )
}
complete -F _t_complete t


# --- tool init (zsh -> bash) -----------------------------------------------
#eval "$(thefuck --alias)"
eval "$(starship init bash)"
eval "$(gh completion -s bash)"
#eval "$(gh copilot alias -- bash)"

#source <(temporal completion bash)
source <(docker completion bash)
#source <(kubectl completion bash)
#source <(helm completion bash)

alias d="docker"
#alias k="kubectl"


# ble.sh: attach last (mirrors zsh's plugins-load-then-go ordering)
[[ ${BLE_VERSION-} ]] && ble-attach
