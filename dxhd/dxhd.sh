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
rofi -modi drun -show drun

## launch window switcher
# super + tab
rofi -modi window -show window

## open screenshot menu
# print
scr

## select and capture a window immediately
# super + print
scr c w

## capture fullscreen screenshot immediately
# shift +  print
scr c f

## capture fullscreen screenshot immediately and save it
# ctrl + print
scr s f

## system operations / screen warmness menus
# super + ctrl + {o, w}
{sop,scw}

## change screen warmness
# super + ctrl + {d, n}
scw {"d","n"}

## change the wallpaper
# super + shift + w
go run $SCRIPTS/wallpapers.go

## change volume
# super + mouse{4,5}
pamixer -{i,d} 1
