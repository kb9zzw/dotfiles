#!/bin/env bash

# Don't initialize anaconda
export INIT_CONDA=false

# Include bash config
BASH_INCLUDES=~/.bash_custom/includes
while read -r file; do
  source "$file"
done < <(find ${BASH_INCLUDES} -type f)

# Include local config, if available
[ -f "$HOME/.bashrc.local" ] && source ~/.bashrc.local
true
