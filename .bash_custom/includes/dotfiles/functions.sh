#!/bin/bash

dotfiles() {
  if [[ $1 == update ]]; then
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME pull origin master

  else
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
  fi
}
