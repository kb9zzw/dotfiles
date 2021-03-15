#!/bin/zsh

# Check for tfenv
if [ -e "$HOME/.tfenv" ]; then
  export TFENV_HOME="$HOME/.tfenv"
  export PATH="$TFENV_HOME/bin:$PATH"
fi
