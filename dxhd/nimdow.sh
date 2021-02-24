#!/bin/sh

# super + shift + r
nimdow --reload-config

# super + k
nimdow --focus-previous

# super + j
nimdow --focus-next

# super + shift + k
nimdow --move-window-previous

# super + shift + j
nimdow --move-window-next

# super + f
nimdow --toggle-fullscreen

# super + shift + q
nimdow --destroy-selected-window

# super + {1-9}
nimdow --go-to-tag {1-9}

# super + w
nimdow --go-to-previous-tag

# super + shift + {1-9}
nimdow --move-window-to-tag {1-9}

# super + shift + w
nimdow --move-window-to-previous-tag

# super + control + {1-9}
nimdow --toggle-tag-view {1-9}

# super + shift + control + {1-9}
nimdow --toggle-window-tag {1-9}

# super + comma
nimdow --focus-previous-monitor

# super + period
nimdow --focus-next-monitor

# super + shift + comma
nimdow --move-window-to-previous-monitor

# super + shift + period
nimdow --move-window-to-next-monitor

# super + z
nimdow --increase-master-count

# super + x
nimdow --decrease-master-count

# super + space
nimdow --toggle-floating

# super + u
nimdow --jump-to-urgent-window
