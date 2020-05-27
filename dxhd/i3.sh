#!/bin/sh

## reload the i3 configuration file / restart i3 inplace
# super + shift + {c, r}
i3-msg -t command {reload,restart}

## kill the focused window
# super + shift + q
i3-msg -t command kill

## focus or swap the selected window
# super + {_, shift + } {h, j, k, l}
i3-msg -t command {focus,move} {left,down,up,right}

## move the focused window to the scratchpad
# super + {shift, ctrl} + s
i3-msg -t command {move scratchpad,scratchpad show}

## toggle window floating/fullscreen/sticky
# super + {shift + space, f, o}
i3-msg -t command {floating toggle,fullscreen toggle,sticky toggle}

## focus a tiling/floating window
# super + space
i3-msg -t command focus mode_toggle

## switch to the workspace number
# super + {_, shift + } {1-9, 0}
i3-msg -t command {_,move container to} workspace {1-9,10}

## switch to the back and forth workspace
# super + w
i3-msg -t command workspace back_and_forth

## resize a window
# super + alt + {h, j, k, l}
i3-msg -t command resize {shrink width,grow height,shrink height,grow width} 10 px or 10 ppt
