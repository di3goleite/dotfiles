set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"*****************************************************************************
" Bundles
"*****************************************************************************

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Interface
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" File
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'taiansu/nerdtree-ag'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Utilities
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'easymotion/vim-easymotion'
Plugin 'ap/vim-css-color'
Plugin 'gko/vim-coloresque'
Plugin 'tpope/vim-surround'

" HTML
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'

" CSS
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'wavded/vim-stylus'
Plugin 'groenewege/vim-less'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'gavocanov/vim-js-indent'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

"*****************************************************************************
" Basic Setup
"*****************************************************************************

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Map leader to ,
let mapleader=','

" Fix backspace indent
set backspace=indent,eol,start

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Encoding
set bomb
set binary

" Indentation rules
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set cindent

" Customize word separators
set iskeyword+=_,$,@,%,#

" Enable copy and past to clipboard
set clipboard=unnamed

" Disable swap files
set noswapfile

" Improvements
set autoread " reload files when changed on disk, i.e. via `git checkout`

"*****************************************************************************
" Visual Settings
"*****************************************************************************
set ruler
set number
set relativenumber
set t_Co=256
set mouse-=a
set cursorline
set synmaxcol=200
set guioptions=egmrti
set ttyfast

if &term =~ '256color'
  set t_ut=
endif

syntax enable
set background=dark

" Disable the blinking cursor
set gcr=a:blinkon0
set scrolloff=3

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" Status bar
set laststatus=2

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'dark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" MacVim gui options
if has('gui_running')
  set guifont=Monaco:h14
  let g:airline_theme='base16'
  let base16colorspace=256
  colorscheme base16-bright
  au VimEnter * NERDTreeToggle /Users/diegoleite/Workspace/
endif

"*****************************************************************************
" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Fix PHP syntax
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set autoread

"*****************************************************************************
" Advanced Setup
"*****************************************************************************

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'bower_components']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" CtrlP
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist|vendor|public)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore '+ g:ctrlp_custom_ignore +' -g ""'
endif

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Ag
let g:ag_working_path_mode="r"

" JSX syntax highlighting
let g:jsx_ext_required=0

" Fix PHP syntax
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

" Force vim to indent a blade file as html
au BufReadPost *.blade.php set filetype=html

"*****************************************************************************
" Mappings
"*****************************************************************************

" replace currently selected text with default register
" without yanking it
vnoremap p "_dP

" NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :NERDTreeFind<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

