#!/bin/bash

# install pathogen

mkdir -p ./.vim/autoload ./.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ensure plugins

git submodule init
git submodule update

cd ./.vim/bundle
git submodule update --init --recursive
python install.py --clang-completer --clangd-completer --ts-completer --go-completer

