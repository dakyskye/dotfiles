#!/bin/sh

TMP=$(mktemp -d)

mkdir "$TMP"/nerd
mkdir "$TMP"/powerline

git clone https://github.com/ryanoasis/nerd-fonts --depth 1 "$TMP"/nerd
git clone https://github.com/powerline/fonts --depth 1 "$TMP"/powerline

"$TMP"/nerd/install.sh
"$TMP"/powerline/install.sh

rm -rf "$TMP"
