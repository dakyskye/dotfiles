#!/bin/sh

# super + shift + r
nimdow --reload-config

# super + {k, j}
nimdow --focus-{previous,next}

# super + shift + {k, j}
nimdow --move-window-{previous,next}

# super + f
nimdow --toggle-fullscreen

# super + shift + q
nimdow --destroy-selected-window

# super + {1-9}
nimdow --go-to-tag {1-9}

# super + {_, shift + } w
nimdow --{go-to-previous-tag,move-window-to-previous-tag}

# super + {control, shift, shift + control} + {1-9}
nimdow --{toggle-tag-view,move-window-to-tag,toggle-window-tag} {1-9}

# super + {comma, period}
nimdow --focus-{previous,next}-monitor

# super + shift + {comma, period}
nimdow --move-window-to-{previous,next}-monitor

# super + {z, l}
nimdow --increase-master-{count,width}

# super + {x, h}
nimdow --decrease-master-{count,width}

# super + space
nimdow --toggle-floating

# super + u
nimdow --jump-to-urgent-window
