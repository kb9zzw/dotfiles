#!/bin/bash

if [[ $OSTYPE == darwin* ]]; then
  # Mac-specific stuff
  RBENV=/usr/local/bin/rbenv
else
  # Linux
  RBENV=$HOME/.rbenv/bin/rbenv
  export PATH=$HOME/.rbenv/bin:$PATH
fi

# Initialize rbenv
if [ -e "$RBENV" ]; then
  eval "$($RBENV init -)"
fi
