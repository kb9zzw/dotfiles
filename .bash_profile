#!/bin/env bash

# Include bash config
BASH_INCLUDES=~/.bash_includes
while read -r file; do
  source "$file"
done < <(find ${BASH_INCLUDES} -type f)

# Include local config, if available
[ -f "$HOME/.bash_local" ] && source ~/.bash_local
true
