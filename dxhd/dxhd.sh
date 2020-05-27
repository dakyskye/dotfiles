#!/bin/sh

## reload dxhd
# super + escape
dxhd -r

## launch alacritty
# super + return
alacritty

## launch alacritty with dash shell
# super + shift + return
alacritty -e dash

## launch rofi
# super + d
##alacritty
rofi -modi drun -show drun

## launch window switcher
# super + tab
rofi -modi window -show window

## open screenshot menu
# print
scr

## select and capture a window immediately
# super + print
scr wc

## capture fullscreen screenshot immediately
# shift +  print
scr fc

## capture fullscreen screenshot immediately and save it
# ctrl + print
scr fs

## system operations / screen warmness menus
# super + ctrl + {o, w}
{sop,scw}

## change screen warmness
# super + ctrl + {d, n}
scw {"d","n"}

## change the wallpaper
# super + shift + w
go run $SCRIPTS/wallpapers.go
