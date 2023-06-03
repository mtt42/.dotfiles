export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

CURRENT_UID=`id | sed 's/^uid=//;s/(.*$//'`
CURRENT_SYSTEM=`uname -s | tr '[A-Z]' '[a-z]'`
