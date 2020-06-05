#!/bin/zsh
#!/bin/zsh

# autocomplete
TERRAFORM=$(command -v terraform 2> /dev/null)
if [ -n "$TERRAFORM" ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "$TERRAFORM" terraform
fi
