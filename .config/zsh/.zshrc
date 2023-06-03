#######################################
# FUNCTIONS 
#######################################

# Check if file exists
_have() { type "$1" &>/dev/null; }

# Check if file exists and source it
_source_if() { [[ -r "$1" ]] && source "$1"; }

# Append a directory to the PATH
function path_append {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$PATH:$1"
  fi
}

# Prepend a directory to the PATH 
function path_prepend {
  if [[ -d "$1" ]] && [[ ":$:PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Look up Wikipedia from terminal
wp() { 
  dig +short txt ${1}.wp.dg.cx 
}


#######################################
# SETTINGS 
#######################################

# ZSH autocompletion
autoload -Uz compinit &&compinit  # ZSH autocompletion

# History
# Big history for use with many open
# shells and no dups. Different history files for root and
# standard user

if (( ! EUID )); then
  HISTFILE=$ZSH_CACHE/history_root
else
  HISTFILE=$ZSH_CACHE/history
fi

SAVEHIST=10000
HISTSIZE=12000

setopt share_history append_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space
setopt AUTO_CD

# Path
path_prepend "$HOME/.local/bin"


#######################################
# ALIASES
#######################################

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# File and directory listing
alias lsi='ls -lhi'
alias lsd='ls -dalG */' 
alias lsf='ls -laF | grep -v '/''
alias file='file -h'

# Actions
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias rmdir='rm -ri'

# Python
alias python=python3
alias pip=pip3

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Good old clear screen
alias cls='clear'

# Get current week
alias week='date +%W'

# Config Files
alias reload!='source $ZDOTDIR/.zshrc'
alias zshrc=" $EDITOR $ZDOTDIR/.zshrc; source $ZDOTDIR/.zshrc"


# Apps
alias lg=lazygit

# Scripts
alias tmx="$HOME/scripts/tmuxit"


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"
