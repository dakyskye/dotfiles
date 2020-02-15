#!/bin/bash

# install pathogen

mkdir -p ./.vim/autoload ./.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ensure plugins

git submodule update --init --recursive

cd ./.vim/bundle
python install.py --clang-completer --clangd-completer --ts-completer --go-completer

cd ../vim-prettier
yarn install
