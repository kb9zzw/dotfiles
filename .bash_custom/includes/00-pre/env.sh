#!/bin/bash

# Fix spelling errors in cd
shopt -s cdspell

# Default editor, prefer nvim
command -v nvim &> /dev/null && EDITOR="nvim" || EDITOR="vim"
export EDITOR

# Set pager
export PAGER='less -rFX'

# Set UTF8
export LANG='en_US.UTF-8'

# enable bash completion in interactive shells
if ! shopt -oq posix; then
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Colorized less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# cdpath
export CDPATH=.

# Add workspace to cdpath
if [ -e "${HOME}/workspace" ]; then
  export CDPATH="${CDPATH}:${HOME}/workspace"
fi

# prefer GNU sed on Mac
if [ -e "/usr/local/opt/gnu-sed/libexec/gnubin" ]; then
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
fi
