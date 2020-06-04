#!/bin/sh

TMP=$(mktemp -d)

git clone https://gitlab.com/dwt1/wallpapers "$TMP"

mv "$TMP/*.jpg" ./

rm -f "$TMP"
