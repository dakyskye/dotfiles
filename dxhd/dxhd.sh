#!/bin/sh

## reload dxhd
# super + escape
dxhd -r

## launch zsh/xon.sh/bash
# super + {_, shift +, ctrl + } return
kitty {zsh,xon.sh,bash}

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
pavucontrol

## launch some apps
# XF86 {Explorer, HomePage, Mail, Calculator}
{kitty ranger, $BROWSER, mailspring, kitty xon.sh}

## super + XF86 {Explorer, HomePage, Mail, Calculator}
## shift + XF86 {Explorer, HomePage, Mail, Calculator}
## alt + XF86 {Explorer, HomePage, Mail, Calculator}
