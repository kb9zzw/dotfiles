#!/bin/bash

# Default editor, prefer nvim
if command -v nvim &> /dev/null
then
  alias vi='nvim'
  alias vim='nvim'
else
  alias vi='vim'
fi

# foot gun prevention
alias rm='rm -i'
alias mv='mv -i'
alias cp="cp -i"

# Power Clear!
alias clear="printf '\33c\e[3J'"

# grep
alias grep='grep --color=auto'

# colorized ls
if ls --color=auto &> /dev/null
then
  alias ls="ls --color=auto"
fi

# ls
alias ll="ls -l"
alias la="ls -la"
alias lut="ls -lut"

# color diff
which colordiff &>/dev/null && alias diff=colordiff

# df ignore snaps
alias df="df -x'squashfs'"

# cd
alias c="cd"
alias ..='cd ..'
alias cd..='cd ..'
