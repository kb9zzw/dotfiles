#!/bin/bash

DOTFILES=$(dirname "$0")

banner() {
cat <<"EOF"

   __| | ___ | |_ / _(_) | ___  ___ 
  / _` |/ _ \| __| |_| | |/ _ \/ __|
 | (_| | (_) | |_|  _| | |  __/\__ \
  \__,_|\___/ \__|_| |_|_|\___||___/

EOF
}

sync() {
	rsync --exclude ".git/" \
		--exclude "install.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
    --exclude "darwin" \
		-avh --no-perms "${DOTFILES}/" "$HOME"

  # Mac
  uname | grep Darwin &> /dev/null && 
    rsync -avh --no-perms "${DOTFILES}/darwin/" "$HOME"
}

# initialize fzf
init_fzf() {
  FZF="${FZF_SRC:-https://github.com/junegunn/fzf.git}"

  if [ ! -d "${HOME}/.fzf" ]; then
    git clone --depth 1 "${FZF}" ~/.fzf
    ~/.fzf/install --all --no-update-rc
  fi
}

init_oh_my_zsh() {
  if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    export KEEP_ZSHRC="yes"
    export RUNZSH="no"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
}

# initialze vim
init_vim() {
  if command -v vim &> /dev/null && \
    ! [ -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
    vim || [ -d "${HOME}/.vim/bundle/Vundle.vim" ]
  fi
}

# initialize vscode
init_vscode() {
  if command -v code &> /dev/null && \
    ! [ -d "${HOME}/.vscode/extensions" ]; then
    vscode_extensions 
  fi
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	sync;
else
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync;
	fi;
fi;

source ~/.bash_profile

# Post-processing
init_fzf
init_oh_my_zsh
init_vim
init_vscode

banner
echo "Installed!"
