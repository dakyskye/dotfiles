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

## change volume
# XF86Audio { Lower, Raise } Volume
pamixer -{d,i} 1

## toggle mute
# XF86AudioMute
pamixer -t

## control media player
# XF86Audio {Stop, Prev, Play, Next}
playerctl {stop, previous, play-pause, next}

## launch pavucontrol
# XF86Tools
pavucontrol-qt

## launch some apps
# XF86{Explorer, HomePage, Mail, Calculator}
{pcmanfm-qt, $BROWSER, $BROWSER 'gmail.com', speedcrunch}

## launch rofimoji
# super + shift + e
rofimoji -c --skin-tone neutral
