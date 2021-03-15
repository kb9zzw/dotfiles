#!/bin/zsh

# Check for tfenv
if [ -e "$HOME/.tfenv" ]; then
  export TFENV_HOME="$HOME/.tfenv"
  export PATH="$TFENV_HOME/bin:$PATH"
fi

# autocomplete
TERRAFORM=$(command -v terraform 2> /dev/null)
if [ -n "$TERRAFORM" ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "$TERRAFORM" terraform
fi
