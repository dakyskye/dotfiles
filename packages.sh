#!/usr/bin/env bash

echo "sorry, exitting the script because it does not call proper command for brew casks"
echo "this will be fixed at some point and script will become runnable"
exit 0

packages=(
	antigen
	bat
	exa
	fzf
	gh
	git-delta
	golangci-lint
	neofetch
	neovim
	pfetch
	ripgrep
	starship
	thefuck
	tldr
	tree-sitter

	font-fira-code
	font-fira-code-nerd-font
	font-fira-mono
	font-fira-mono-nerd-font
	font-jetbrains-mono
	font-jetbrains-mono-nerd-font
)

echo -e "type \033[1m$EDITOR packages.sh\033[0m to inspect the script"
echo "would you like to install all those packages? [y/N]"
read -r ANS
case "$ANS" in
	y|Y)
		brew install ${packages[*]}
		;;
	*)
		echo "all right then, aborting the instalation"
		;;
esac
