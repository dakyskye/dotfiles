#!/bin/sh

## reload dxhd
# super + escape
dxhd -r

## launch kitty
# super + return
kitty

## launch kitty with dash shell
# super + shift + return
kitty dash

## launch rofi
# super + d
rofi -modi drun -show drun

## launch window switcher
# super + tab
rofi -modi window -show window

## launch rofimoji
# super + shift + e
rofimoji -c --skin-tone neutral

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

## launch flameshot gui
# alt + print
flameshot gui

## system operations / screen warmness menus
# super + ctrl + {o, w}
{sop,scw}

## change screen warmness
# super + ctrl + {d, n}
scw {"d","n"}

## enable/disable DND mode
# super + alt + ctrl + {d,f}
s_dnd {dnd,free}

## change volume
# XF86Audio { Lower, Raise } Volume
pamixer -{d,i} 1

## toggle mute
# XF86AudioMute
pamixer -t

## control media player
# XF86Audio {Stop, Prev, Play, Next}
playerctl {stop, previous, play-pause, next}

## seeking forward/backwards
# alt + XF86Audio {Stop, Prev, Next}
playerctl position {0, 5-, 5+}

## launch pavucontrol
# XF86Tools
pavucontrol-qt

## play music playlist
# alt + XF86Tools
mpv $HOME/Music/* --shuffle --loop-playlist

## launch some apps
# XF86 {Explorer, HomePage, Mail, Calculator}
{pcmanfm-qt, $BROWSER, $BROWSER 'gmail.com', speedcrunch}

## super + XF86 {Explorer, HomePage, Mail, Calculator}
## shift + XF86 {Explorer, HomePage, Mail, Calculator}
## alt + XF86 {Explorer, HomePage, Mail, Calculator}
