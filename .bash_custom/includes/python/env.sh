#!/bin/bash

if [[ $OSTYPE == darwin* ]]; then
  # Mac-specific stuff
  PYENV=/usr/local/bin/pyenv

  # Sets up pyenv to use homebrew tcl-tk libs
  if [ -d "/usr/local/opt/tcl-tk" ]; then
    export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
    export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
    export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
  fi
else
  # Linux
  PYENV=$HOME/.pyenv/bin/pyenv
  export PATH=$HOME/.pyenv/bin:$PATH
fi

# Initialize pyenv
if [ -e "$PYENV" ]; then
  eval "$($PYENV init -)"
fi

# Check for pyenv-virtualenv
if [ -e "$HOME/.pyenv/plugins/python-virtualenv" ]; then
  eval "$($PYENV virtualenv-init -)"
fi
