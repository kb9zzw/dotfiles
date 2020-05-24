#!/bin/bash

DOTFILES=$(dirname "$0")
DOTFILES_LOCAL_SRC=${DOTFILES_SRC:-https://gitlab.com/kb9zzw/dotfiles.git}
DOTFILES_LOCAL_BRANCH=${DOTFILES_BRANCH:-master}

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
  for file in $(dotfiles checkout $DOTFILES_LOCAL_BRANCH 2>&1 | egrep "^\s+" | awk '{print $1}'); do
    mkdir -p $HOME/.dotfiles-backup/$(dirname $file)
    mv -f $HOME/$file $HOME/.dotfiles-backup/$file
  done
}

install() {
  if [ ! -d $HOME/.dotfiles ]; then
    mkdir -p $HOME/.dotfiles
    git init --bare $HOME/.dotfiles
    dotfiles remote add origin $DOTFILES_LOCAL_SRC
    dotfiles config --local core.sparseCheckout true
    dotfiles config --local status.showUntrackedFiles no
    cat > $HOME/.dotfiles/info/sparse-checkout <<EOF
/*
!LICENSE
!README.md
!install.sh
EOF

  # exclude macosx only config
    if [[ $OSTYPE != darwin* ]]; then
      cat >> $HOME/.dotfiles/info/sparse-checkout << EOF
!Library
!.iterm2
EOF
    fi
  fi
  dotfiles fetch origin $DOTFILES_LOCAL_BRANCH
  backup
  dotfiles checkout $DOTFILES_LOCAL_BRANCH
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

install

source ~/.bash_profile

# Post-processing
init_fzf
init_oh_my_zsh
init_vim
init_vscode

banner
echo "Installed!"
