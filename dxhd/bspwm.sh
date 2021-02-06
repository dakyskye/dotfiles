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

# super + {_, shift +} {h, j, k, l}
bspc node -{f,s} {west.local, south.local, north.local, east.local}

# super + shift + q
bspc node -c

# super + {t, shift + t, space, f, s}
bspc node {-t tiled, -t pseudo_tiled, -t floating, -t fullscreen, -g sticky}

# alt + {h, j, k, l}
bspc node -z {right -20 0, bottom 0 20, bottom 0 -20, right 20 0}

# ctrl + shift + {h, j, k, l}
bspc node -v {-20 0, 0 20, 0 -20, 20 0}
