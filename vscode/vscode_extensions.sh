#!/bin/bash

if [ -n "${VSCODE_DISABLED}" ]; then
  echo "vscode extension management disabled"
  exit 1
fi

for ext in $(cat ~/.vscode/extensions.txt); do
  code --install-extension $ext
done
