#!/bin/bash

# history
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoredups:ignoreboth:ignorespace
export HISTIGNORE="ls:history"
HIST_BLUE="\033[0;34m"
HIST_NOCOLOR="\033[0m"
export HISTTIMEFORMAT=`echo -e ${HIST_BLUE}[%F %T] ${HIST_NOCOLOR} `
export HISTFILESIZE=10000
export HISTSIZE=10000
