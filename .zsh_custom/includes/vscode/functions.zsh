#!/bin/zsh

VSCODE_EXTENSIONS=~/.vscode/extensions.txt

function vscode_extensions() {

  if [ -n "${VSCODE_DISABLED}" ]; then
    echo "vscode extension management disabled"
    exit 1
  fi

  while read -r ext; do
    code --install-extension "$ext"
  done < <(cat ${VSCODE_EXTENSIONS})
}
