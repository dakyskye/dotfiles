#!/bin/sh

mkdir -p "$(dirname $0)/plugins"
cd "$(dirname $0)/plugins"

git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search
