#!/bin/sh

## launch alacritty
# super + Return
alacritty

## launch alacritty with dash shell
# super + shift + Return
alacritty -e dash

## launch rofi
# super + d
rofi -modi drun -show drun

## launch window switcher
# super + Tab
rofi -modi window -show window

## open screenshot menu
# Print
scr

## select and capture a window immediately
# super + Print
scr wc

## capture fullscreen screenshot immediately
# shift +  Print
scr fc

## capture fullscreen screenshot immediately and save it
# ctrl + Print
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
