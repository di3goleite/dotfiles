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
Plugin 'tomasr/molokai'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'whatyouhide/vim-gotham'

" File
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs.git'
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
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'easymotion/vim-easymotion'
Plugin 'ap/vim-css-color'
Plugin 'gko/vim-coloresque'

" Languages
Plugin 'scrooloose/syntastic'

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

" Enable copy and past to clipboard
set clipboard=unnamedplus

" Disable swap files
set noswapfile

" Improvements
set autoread " reload files when changed on disk, i.e. via `git checkout`

"*****************************************************************************
" Visual Settings
"*****************************************************************************
set ruler
set number
set relativenumber " use relative line instead of absolute
set t_Co=256
set mouse-=a
set cursorline
set guioptions=egmrti

syntax enable
set background=dark
colorscheme molokai

if &term =~ '256color'
  set t_ut=
endif

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
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

set autoread

"*****************************************************************************
" Advanced Setup
"*****************************************************************************

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" CtrlP
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist|vendor)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore '+ g:ctrlp_custom_ignore +' -g ""'
endif

" Ag
let g:ag_working_path_mode="r"

" syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" JSX syntax highlighting
let g:jsx_ext_required=0

" lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'readonly': 'LightLineReadonly',
    \   'modified': 'LightLineModified',
    \   'filename': 'LightLineFilename',
    \   'ctrlpmark': 'CtrlPMark'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
            \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

" Fix PHP syntax
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

"*****************************************************************************
" Mappings
"*****************************************************************************

" replace currently selected text with default register
" " without yanking it
vnoremap p "_dP

" NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :NERDTreeFind<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Git add --all<CR><CR>
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

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

if has('gui_running')
  set macligatures
  set guifont=Fira\ Code\ Light:h14
  set ttyfast
  set mouse=a
  colorscheme gotham
  au VimEnter * NERDTreeToggle /Users/diegoleite/Workspace/

  " Disable bold text
  set t_Co=8 t_md=

  " lightline
  let g:lightline = {
    \ 'colorscheme': 'gotham256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'readonly': 'LightLineReadonly',
    \   'modified': 'LightLineModified',
    \   'filename': 'LightLineFilename',
    \   'ctrlpmark': 'CtrlPMark'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

  " From Yadr
  hi! link txtBold Identifier
  hi! link zshVariableDef Identifier
  hi! link zshFunction Function
  hi! link rubyControl Statement
  hi! link rspecGroupMethods rubyControl
  hi! link rspecMocks Identifier
  hi! link rspecKeywords Identifier
  hi! link rubyLocalVariableOrMethod Normal
  hi! link rubyStringDelimiter Constant
  hi! link rubyString Constant
  hi! link rubyAccess Todo
  hi! link rubySymbol Identifier
  hi! link rubyPseudoVariable Type
  hi! link rubyRailsARAssociationMethod Title
  hi! link rubyRailsARValidationMethod Title
  hi! link rubyRailsMethod Title
  hi! link rubyDoBlock Normal
  hi! link MatchParen DiffText

  hi! link CTagsModule Type
  hi! link CTagsClass Type
  hi! link CTagsMethod Identifier
  hi! link CTagsSingleton Identifier

  hi! link javascriptFuncName Type
  hi! link jsFuncCall jsFuncName
  hi! link javascriptFunction Statement
  hi! link javascriptThis Statement
  hi! link javascriptParens Normal
  hi! link jOperators javascriptStringD
  hi! link jId Title
  hi! link jClass Title

  " Javascript language support
  hi! link javascriptJGlobalMethod Statement

  " Make the braces and other noisy things slightly
  " less noisy
  hi! jsParens guifg=#005F78 cterm=NONE term=NONE
  ctermfg=NONE ctermbg=NONE
  hi! link jsFuncParens jsParens
  hi! link jsFuncBraces jsParens
  hi! link jsBraces jsParens
  hi! link jsParens jsParens
  hi! link jsNoise jsParens

  hi! link NERDTreeFile Constant
  hi! link NERDTreeDir Identifier

  hi! link sassMixinName Function
  hi! link sassDefinition
  Function
  hi! link sassProperty Type
  hi! link htmlTagName Type
  hi! PreProc gui=bold

  " Solarized separators are a little garish.
  " This moves separators, comments, and normal
  " text into the same color family as the background.
  " Using the http://drpeterjones.com/colorcalc/,
  " they are now just differently saturated and
  " valued riffs on the background color, making
  " everything play together just a little more nicely.
  " hi! VertSplit guifg=#003745 cterm=NONE term=NONE ctermfg=NONE ctermbg=NONE
  " hi! LineNR guifg=#004C60 gui=bold guibg=#002B36 ctermfg=146
  " hi! link NonText VertSplit
  " hi! Normal guifg=#77A5B1
  " hi! Constant guifg=#00BCE0
  " hi! Comment guifg=#52737B
  " hi! link htmlLink Include
  " hi! CursorLine cterm=NONE gui=NONE
  " hi! Visual ctermbg=233
  " hi! Type gui=bold
  " hi! EasyMotionTarget ctermfg=100 guifg=#4CE660 gui=bold
endif


