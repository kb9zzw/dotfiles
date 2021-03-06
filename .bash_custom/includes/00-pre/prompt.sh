#!/bin/bash

# color settings
export CLICOLOR=''
MY_COLORRESET="\[\033[0m\]"
MY_RED="\[\033[0;31m\]"
MY_GREEN="\[\033[0;32m\]"
MY_BROWN="\[\033[0;33m\]"
MY_BLUE="\[\033[0;34m\]"
MY_PURPLE="\[\033[0;35m\]"
MY_CYAN="\[\033[0;36m\]"
MY_LTGRAY="\[\033[0;37m\]"

MY_DKGRAY="\[\033[1;30m\]"
MY_LTRED="\[\033[1;31m\]"
MY_LTGREEN="\[\033[1;32m\]"
MY_YELLOW="\[\033[1;33m\]"
MY_LTBLUE="\[\033[1;34m\]"
MY_LTPURPLE="\[\033[1;35m\]"
MY_LTCYAN="\[\033[1;36m\]"
MY_WHITE="\[\033[1;37m\]"

# shorten long paths
export PROMPT_DIRTRIM=2

# elipsize long hostnames
trimhost() {
  if [ "${#HOSTNAME}" -ge "10" ]; then
    echo ${HOSTNAME:0:7}...
  else
    echo ${HOSTNAME}
  fi
}

# Load git prompt
# centos
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]
then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# macos
if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]
then
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
fi

export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWCOLORHINTS=1

# Disable virtual environment handling of prompt, we'll take care of it ourselves.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Prompt command
set_prompt() {
  local exit=$?

  # Userstring
  if [[ $(id -un) == 'root' ]]
  then
    USERSTRING="${MY_LTRED}\u"
    PS1_MARK="${MY_LTRED}#"
    PS2_MARK="${MY_LTRED}>"
  else
    USERSTRING="${MY_GREEN}\u"
    PS1_MARK="${MY_CYAN}~>"
    PS2_MARK="${MY_CYAN}.."
  fi

  # Git prompt
  if declare -f __git_ps1 > /dev/null 2>&1
  then
    MYGITPROMPT="${MY_LTPURPLE}\$(__git_ps1) "
  else
    MYGITPROMPT=''
  fi

  # Python virtual env
  if [ -n "${VIRTUAL_ENV}" ]; then
    MY_VENV="${MY_YELLOW}[$(basename $VIRTUAL_ENV)] "
  else
    MY_VENV=''
  fi

  if [ -n "${CONDA_DEFAULT_ENV}" ]; then
    MY_CONDA_ENV="${MY_YELLOW}c[${CONDA_DEFAULT_ENV}] "
  else
    MY_CONDA_ENV=""
  fi

  # Current working directory
  MY_CWD="${MY_LTBLUE}\w"

  # exit status 
  if [[ "$exit" -ne 0 ]]; then
    MY_EXIT_STATUS="${MY_RED}$exit "
  else 
    MY_EXIT_STATUS=''
  fi

  # Prompt
  PS1="${USERSTRING}@${HOSTNAME} ${MY_EXIT_STATUS}${MY_VENV}${MY_CONDA_ENV}${MY_CWD}${MYGITPROMPT}\n${PS1_MARK}${MY_COLORRESET} "
  PS2="${PS2_MARK}${MY_COLORRESET} "

  # Window title
  echo -ne "\033]0;${HOSTNAME%%.*}"; echo -ne "\007"

  # append history immediately
  history -a
}

# Dynamic prompt
PROMPT_COMMAND=set_prompt
