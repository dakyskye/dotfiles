#!/bin/sh

DIR="$(dirname $(readlink -f $0))"
PLUGINS="$DIR/plugins"
THEMES="$DIR/themes"

mkdir "$PLUGINS"
mkdir "$THEMES"

cd "$PLUGINS"
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search

cd "$THEMES"
git clone https://github.com/denysdovhan/spaceship-prompt
ln -s "$THEMES/spaceship-prompt/spaceship.zsh-theme" "$THEMES/spaceship.zsh-theme"

echo "done"
