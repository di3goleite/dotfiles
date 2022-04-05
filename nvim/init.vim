"*****************************************************************************
" Plugins
"*****************************************************************************
call plug#begin('~/.local/share/nvim/plugged')

" Color Schemes
Plug 'tpope/vim-vividchalk'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'patstockwell/vim-monokai-tasty'
Plug 'whatyouhide/vim-gotham'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'taiansu/nerdtree-ag'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Utilities
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'troydm/zoomwintab.vim'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'elzr/vim-json'

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }


" TypeScript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" JSX
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Linter
Plug 'dense-analysis/ale'

" All of your Plugins must be added before the fodense-analysis/alellowing line
" Initialize plugin system
call plug#end()

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
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set cindent

" Enable fold
set foldmethod=indent
set nofoldenable

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
set mouse-=a
set cursorline
set signcolumn=yes
set guioptions=egmrti
set ttyfast
set lazyredraw
set scrolloff=3

" Colorscheme stuff
syntax enable
set background=dark
colorscheme vividchalk

" Remove cursor line underline
hi CursorLine cterm=none
hi CursorLine gui=none

" Set hlsearch background color
hi Search ctermbg=DarkGray
hi Search ctermfg=White

" Disable the blinking cursor
set gcr=a:blinkon0

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" Ale
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#BBBB00 ctermfg=3
highlight GitGutterDelete guifg=#FF2222 ctermfg=1

" Sign column
highlight! link SignColumn LineNr

" Status bar
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'simple'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#ale#enabled = 1

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

" Close tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Update GitGutter signs once a file is saved
autocmd BufWritePost * GitGutter

"*****************************************************************************
" Advanced Setup
"*****************************************************************************

" Autocomplete based on filetype
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Ack
cnoreabbrev Ack Ack!

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'bower_components', 'build']
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 34
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

" Tagbar
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" Ag
let g:ag_working_path_mode="r"

" Ale
let b:ale_fixers = ['stylelint', 'eslint']
let b:ale_linter_aliases = ['css', 'scss', 'javascript']
let b:ale_linters = ['stylelint', 'stylelint-scss', 'eslint']

" JSX syntax highlighting
let g:jsx_ext_required=0

" TypeScript configuration
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_shortest_import_path = 1

" Force vim to indent blade files as html
au BufReadPost *.blade.php set filetype=html
au BufReadPost *.tsx set filetype=typescript

" Tmux config
if $TMUX == ''
  set clipboard+=unnamed
endif

" GUI specific setup
if has('gui_running')
  " NERDTree
  au VimEnter * NERDTreeToggle /Users/diegoleite/Workspace/

  " One Dark/Light
  " colorscheme onehalfdark
  " let g:airline_theme = 'onehalfdark'

  " Monokai Tasty
  " let g:vim_monokai_tasty_italic = 1
  " colorscheme vim-monokai-tasty
  " let g:airline_theme = 'monokai_tasty'

  " Gotham
  colorscheme gotham
  let g:airline_theme = 'gotham'
endif


"*****************************************************************************
" Mappings
"*****************************************************************************

" Replace currently selected text with default register
" without yanking it
vnoremap p "_dP

" Excluding trailing whitespace from visual mode select
vnoremap $ g_

" File navigation
nnoremap gb <C-^>

" NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :NERDTreeFind<CR>

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Ack
nnoremap <Leader>a :Ack!<Space>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Git add -- .<CR><CR>
noremap <Leader>gc :Git commit<CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :GRemove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Clean search (highlight)
nnoremap <silent> <Leader><space> :noh<cr>

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

