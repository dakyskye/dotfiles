#!/bin/sh

TMP=$(mktemp -d)

git clone https://gitlab.com/dwt1/wallpapers --depth 1 "$TMP"

mv "$TMP"/*.jpg $(dirname $(readlink -f "$0"))/

rm -rf "$TMP"
