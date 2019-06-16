# Fix spelling errors in cd
shopt -s cdspell

# Default editor, prefer nvim
if $(which nvim &> /dev/null); then
  alias vi='nvim'
  alias vim='nvim'
  export EDITOR='nvim'
else
  alias vi='vim'
  export EDITOR='vim'
fi

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

# Prompt settings

# shorten long paths
export PROMPT_DIRTRIM=2

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

# elipsize long hostnames
trimhost() {
  if [ "${#HOSTNAME}" -ge "10" ]; then
    echo ${HOSTNAME:0:7}...
  else
    echo ${HOSTNAME}
  fi
}

# Load git prompt
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] # centos
then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
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
    x=$'\u25b8' # filled bullet
    y=$'\u25b9' # open bullet
    PS1_MARK="${MY_CYAN}${x}"
    PS2_MARK="${MY_CYAN}${y}"
  fi

  # Git prompt
  if declare -f __git_ps1 > /dev/null 2>&1
  then
    MYGITPROMPT="${MY_PURPLE}\$(__git_ps1)"
  else
    MYGITPROMPT=''
  fi

  # Python virtual env
  if [ -n "${VIRTUAL_ENV}" ]; then
    MY_VENV=" ${MY_YELLOW}<$(basename $VIRTUAL_ENV)>"
  else
    MY_VENV=''
  fi

  # Current working directory
  MY_CWD=" ${MY_BROWN}\w"

  # exit status 
  if [[ "$exit" -ne 0 ]]; then
    MY_EXIT_STATUS=" ${MY_RED}$exit"
  else 
    MY_EXIT_STATUS=''
  fi

  # Prompt
  PS1="${USERSTRING}@${HOSTNAME}${MY_EXIT_STATUS}${MY_VENV}${MY_CWD}${MYGITPROMPT}\n${PS1_MARK}${MY_COLORRESET} "
  PS2="${PS2_MARK}${MY_COLORRESET} "

  # Window title
  echo -ne "\033]0;${HOSTNAME%%.*}"; echo -ne "\007"

  # append history immediately
  history -a
}

# Dynamic prompt
PROMPT_COMMAND=set_prompt

# foot gun prevention
alias rm='rm -i'
alias mv='mv -i'
alias cp="cp -i"

# Other aliases
alias grep='grep --color=auto'
alias ..='cd ..'
alias cd..='cd ..'

# color diff
which colordiff &>/dev/null && alias diff=colordiff

# Local mods
if [ -f "${HOME}/.bash_profile_local" ]; then
  . ${HOME}/.bash_profile_local
fi

# Colorized less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# History
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoredups:ignoreboth:ignorespace
export HISTIGNORE="ls:history"
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTFILESIZE=10000
export HISTSIZE=10000
