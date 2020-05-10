let run_bundle_install = 0

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/"))
  silent !echo "Installing Vundle..."
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let run_bundle_install = 1
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let vundle manage vundle
Plugin 'VundleVim/Vundle.Vim'

" Vundles
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'plasticboy/vim-markdown'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'dense-analysis/ale'
Plugin 'hashivim/vim-terraform'
Plugin 'editorconfig/EditorConfig'
Plugin 'cohama/lexima.vim'

call vundle#end()

" install plugins
if run_bundle_install == 1
  :PluginInstall

  silent !echo ""
  silent !echo "Vim is now ready."
  :cq
endif

" set leader to space
let mapleader = "\<Space>"

" utf-8
set encoding=utf-8

" disable modelines
set nomodeline

" number lines
set nu

" tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" pep8 compliance for python
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" incremental search
set incsearch

" highlight search results
set hlsearch

" syntax highlighting
syntax on
filetype plugin indent on
colorscheme slate

" shell
set shell=/bin/bash

" toggles
nmap <C-p> :set invpaste<CR>
nmap <C-_> :set invnumber<CR>:GitGutterToggle<CR>:SyntasticToggleMode<CR>

" Window split navigation
nmap <TAB> <C-w>
nmap <TAB><TAB> <C-w>w

" syntastic no 80char check on puppet
let g:syntastic_puppet_puppetlint_args='--no-80chars-check'

" syntastic ignore shellcheck non-constant source (SC1090)
let g:synstastic_sh_shellcheck_args='-e SC1090'

" vim_markdown disable code folding on markdown
let g:vim_markdown_folding_disabled = 1

" nerdcommenter left-justify comments
let g:NERDDefaultAlign = 'left'

" nerdcommenter extra space after comments
let g:NERDSpaceDelims = 1

" nerdtree file browser
map <C-o> :NERDTreeToggle<CR>

" status line
set laststatus=2
set noshowmode

" lightline config
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" cloudformation filetype
au BufRead,BufNewFile *.cfn.yml set filetype=yaml.cloudformation
au BufRead,BufNewFile *.cfn.yaml set filetype=yaml.cloudformation
au BufRead,BufNewFile *.cfn set filetype=yaml.cloudformation

" ale linters
let g:ale_linters = { 'python': ['pylint'],
      \ 'yaml.cloudformation': ['yamllint', 'cloudformation'],
      \ 'yaml': ['yamllint'] }

" ale shellcheck excludes
" SC1090 = non-constant source
let g:ale_sh_shellcheck_exclusions = 'SC1090'

" ale lint highlight colors
hi SpellCap cterm=underline ctermfg=NONE ctermbg=NONE guifg=NONE 
hi SpellBad cterm=bold ctermfg=Black ctermbg=Red

" popup menu colors
hi Pmenu ctermbg=gray guibg=gray
