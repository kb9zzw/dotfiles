#!/bin/bash

# Check for rbenv
if [ -e "$HOME/.rbenv" ]; then
  export RBENV_HOME="$HOME/.rbenv"
  export PATH="$RBENV_HOME/bin:$PATH"
  eval "$($HOME/.rbenv/bin/rbenv init -i)"
fi
