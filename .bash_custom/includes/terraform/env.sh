#!/bin/bash

# autocomplete
TERRAFORM=$(command -v terraform 2> /dev/null)
if [ -n "$TERRAFORM" ]; then
  complete -C "$TERRAFORM" terraform
fi
