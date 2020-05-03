set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Fix weird neovim cursor render problems
" https://github.com/neovim/neovim/wiki/FAQ
set guicursor=
