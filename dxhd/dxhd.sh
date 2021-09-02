#!/bin/sh

## reload dxhd
# super + escape
dxhd -r

## launch empty emacs buffer
# super + e
emacsclient -c -a emacs

## launch emacs vterm
# super + alt + return
emacsclient -c -a emacs -e '(+vterm/here nil)'

## launch dired in emacs
# super + BackSpace
emacsclient -c -a emacs -e '(dired nil)'

## launch zsh/bash
# super + {_, ctrl + } return
kitty {zsh,bash}

## launch rofi
# super + d
rofi -modi drun -show drun

## launch window switcher
# super + tab
rofi -modi window -show window

## launch rofimoji
# super + shift + e
rofimoji --action copy --skin-tone neutral

## select and capture a window immediately
# print
scr c w

## select and capture a window immediately with extra transparent background
# super + print
scr c wt

## capture fullscreen screenshot immediately
# shift + print
scr c f

## capture fullscreen screenshot immediately and save it
# ctrl + print
scr s f

## launch screenshot menu
# super + ctrl + shift + print
scr

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

## change wallpaper
# super + alt + ctrl + w
randwallp

## change volume
# XF86Audio { Lower, Raise } Volume
pactl set-sink-volume @DEFAULT_SINK@ {-,+}1%

## toggle mute
# XF86AudioMute
pactl set-sink-mute @DEFAULT_SINK@ toggle

## control media player
# XF86Audio {Stop, Prev, Play, Next}
playerctl {stop, previous, play-pause, next}

## seeking forward/backwards
# alt + XF86Audio {Stop, Prev, Next}
playerctl position {0, 5-, 5+}

## launch pavucontrol
# XF86Tools
pavucontrol-qt

## launch some apps
# XF86 {Explorer, HomePage, Mail, Calculator}
{kitty ranger, $BROWSER, mailspring, kitty xon.sh}

## super + XF86 {Explorer, HomePage, Mail, Calculator}
## shift + XF86 {Explorer, HomePage, Mail, Calculator}
## alt + XF86 {Explorer, HomePage, Mail, Calculator}
