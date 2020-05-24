#!/bin/bash

DOTFILES=$(dirname "$0")
DOTFILES_LOCAL_SRC=${DOTFILES_SRC:-https://gitlab.com/kb9zzw/dotfiles.git}

banner() {
cat <<"EOF"

   __| | ___ | |_ / _(_) | ___  ___ 
  / _` |/ _ \| __| |_| | |/ _ \/ __|
 | (_| | (_) | |_|  _| | |  __/\__ \
  \__,_|\___/ \__|_| |_|_|\___||___/

EOF
}

dotfiles() {
  /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}

backup() {
  echo "Backing up existing files to ~/.dotfiles-backup"
  for file in $(dotfiles checkout 2>&1 | egrep "\s+\." | awk '{print $1}'); do
    mkdir -p $HOME/.dotfiles-backup/$(dirname file)
    mv -f $HOME/$file $HOME/.dotfiles-backup/$file
  done
}

sync() {
  git clone --bare $DOTFILES_LOCAL_SRC $HOME/.dotfiles
  backup
  dotfiles checkout
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
  else
    exit 0
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
