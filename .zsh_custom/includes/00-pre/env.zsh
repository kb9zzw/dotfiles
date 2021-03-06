# Correct command spelling errors
setopt correct
unsetopt correctall

# Default editor, prefer nvim
command -v nvim &> /dev/null && EDITOR="nvim" || EDITOR="vim"
export EDITOR

# Set pager
export PAGER='less -rFX'

# Set UTF8
export LANG='en_US.UTF-8'

# Colorized less
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# CDPATH
export CDPATH=.

# Add workspace to cdpath
if [ -e "${HOME}/workspace" ]; then
  export CDPATH="${CDPATH}:${HOME}/workspace"
fi

# prefer GNU sed on Mac
if [ -e "/usr/local/opt/gnu-sed/libexec/gnubin" ]; then
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
fi
