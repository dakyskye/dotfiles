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
rofimoji --action copy --skin-tone neutral

## open screenshot menu
# print
flameshot gui

# {ctrl, shift} + print
flameshot {full, screen} -c

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

## launch some apps
# XF86 {Explorer, HomePage, Mail, Calculator}
{pcmanfm-qt, $BROWSER, mailspring, speedcrunch}

## super + XF86 {Explorer, HomePage, Mail, Calculator}
## shift + XF86 {Explorer, HomePage, Mail, Calculator}
## alt + XF86 {Explorer, HomePage, Mail, Calculator}
