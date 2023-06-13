export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.data"

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR=vim
export VISUAL=vim

export TERM="xterm-256color"
[ -z "$TMUX" ] && export TERM=xterm-256color

export PYENV_ROOT="$HOME/.pyenv"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"

. "$HOME/.cargo/env"
