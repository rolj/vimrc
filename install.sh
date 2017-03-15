#!/bin/bash
if [ ! -e ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload 
fi
if [ ! -e ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
fi
# install pathogen plugin
if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# save path
orig_path=`pwd`

# install plugins
cd ~/.vim/bundle
if [ -e nerdtree ]; then
    cd nerdtree 
    git pull
    cd -
else
    git clone https://github.com/scrooloose/nerdtree.git
fi
if [ -e YankRing.vim ]; then
    cd YankRing.vim
    git pull
    cd -
else
    git clone https://github.com/vim-scripts/YankRing.vim.git
fi
if [ -e vim-sensible ]; then
    cd vim-sensible
    git pull
    cd -
else
    git clone git://github.com/tpope/vim-sensible.git
fi

cd ${orig_path}

# backup vimrc
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

# create vimrc
echo '" tab spacing
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

