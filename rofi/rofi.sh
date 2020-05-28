#!/bin/sh

DIR="$(dirname $(readlink -f $0))"

cd $DIR
git clone https://github.com/dracula/rofi
cp rofi/config.rasi ./config.rasi
rm -rf rofi
