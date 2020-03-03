#!/bin/bash

set -e

CURRENT=$PWD

# install pathogen

mkdir -p .config/nvim/autoload .config/nvim/bundle
curl -LSso .config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ensure plugins
git submodule update --init --recursive

# coc
cd .config/nvim/bundle/coc.nvim
yarn install --forzen-lockfile

# done
cd $CURRENT

