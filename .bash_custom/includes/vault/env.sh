#!/bin/bash

VAULT=${VAULT:-$HOME/.local/bin/vault}

if [ -e "$VAULT" ]; then
  # setup vault autocomplete
  export VAULT
  complete -C $VAULT vault
fi
