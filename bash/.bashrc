# source .profile just in case
. ~/.profile
# if we are in a TTY shell, let's use bash
[[ $- != *i* ]] && return
# but fish otherwise
exec fish
