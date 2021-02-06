#!/bin/sh

# super + shift + r
bspc wm -r

# super + {comma, period}
bspc monitor -f {prev, next}

# super + shift + {comma, period}
what="{prev, next}"
bspc node -m $what
bspc monitor -f $what

# super + {_, shift + } {1-9,0}
bspc {desktop -f, node -d} {1-9,10}.local

# super + w
bspc desktop -f last.local
