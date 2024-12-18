source ~/.profile


alias vim="$SCRIPTS/nvim_ostheme; nvim"
alias nvim="$SCRIPTS/nvim_ostheme; nvim"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

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

#eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(gh completion -s zsh)"
eval "$(gh copilot alias -- zsh)"
eval "$(logcli --completion-script-zsh)"

source "$HOME/.acme.sh/acme.sh.env"
source <(temporal completion zsh)
source <(docker completion zsh)
source <(kubectl completion zsh)
#source <(kompose completion zsh)
#source <(helm completion zsh)
#source <(telepresence completion zsh)

alias d="docker"
alias k="kubectl"

# Orbital specific
orbdockerregistry="orbitalmonstrosity:5000"

orbdockerbuild() {
	case "$2" in
		debug)
			echo "building for local debugging purposes using delve"
			docker build --build-arg BUILD="$(git describe --always --tags --dirty)" --file Dockerfile.debug --tag ${1}:latest .
			;;
		amd64)
			echo "building for linux/amd64"
			docker buildx build --builder amd64-builder --platform linux/amd64 --build-arg BUILD="$(git describe --always --tags --dirty)" --tag ${1}:latest . --load
			;;
		*)
			echo "building for the native architecture"
			docker build --build-arg BUILD="$(git describe --always --tags --dirty)" --tag ${1}:latest .
			;;
	esac
}

orbdockerpush() {
	docker tag ${1}:latest ${orbdockerregistry}/${1}:latest
	docker push ${orbdockerregistry}/${1}:latest
}

orbdockerbuildnpush() {
	orbdockerbuild $1 && orbdockerpush $1
}
