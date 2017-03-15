#!/bin/bash
if [ ! -e ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload 
fi
if [ -e ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
fi
# install pathogen plugin
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install plugins
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/vim-scripts/YankRing.vim.git
git clone git://github.com/tpope/vim-sensible.git
cd -

# backup vimrc
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

# create vimrc
echo '
" tab spacing
set number
set tabstop=8
set shiftwidth=4
set softtabstop=4
set noexpandtab
" enable pathogen plugin
execute pathogen#infect()
syntax on
filetype plugin indent on
" nerdtree startup command
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>
" close nerdtree on exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Window/Tab/Split Manipulation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
' > ~/.vimrc

