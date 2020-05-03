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

# color diff
which colordiff &>/dev/null && alias diff=colordiff

# Colorized less
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
