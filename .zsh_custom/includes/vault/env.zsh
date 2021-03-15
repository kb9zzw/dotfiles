#!/bin/zsh

VAULT=${VAULT:-$HOME/.local/bin/vault}

if [ -e "$VAULT" ]; then
  # setup vault autocomplete
  export VAULT
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $VAULT vault
fi
