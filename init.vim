set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'

Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme solarized

map <silent> <F2> :NERDTreeFind<CR>
map <F3> :NERDTreeToggle<CR>
