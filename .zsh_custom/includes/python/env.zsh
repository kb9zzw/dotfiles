#!/bin/zsh

# Check for pyenv
if [ -e "$HOME/.pyenv" ]; then
  export PYENV_HOME="$HOME/.pyenv"
  export PATH="$PYENV_HOME/bin:$PATH"
  eval "$($HOME/.pyenv/bin/pyenv init -)"
fi

# Check for pyenv-virtualenv
if [ -e "$HOME/.pyenv/plugins/python-virtualenv" ]; then
  eval "$($HOME/.pyenv/bin/pyenv virtualenv-init -)"
fi

# Mac-specific stuff
if [[ $OSTYPE == darwin* ]]; then
  # Sets up pyenv to use homebrew tcl-tk libs
  if [ -d "/usr/local/opt/tcl-tk" ]; then
    export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
    export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
    export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
  fi
fi
