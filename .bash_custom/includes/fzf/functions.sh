#!/bin/bash

# Upgrade fzf
function upgrade_fzf() {
  cd ~/.fzf && git pull && ./install --all --no-update-rc
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

export FZF_DEFAULT_OPTS="--height 40% --reverse"

# Load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

