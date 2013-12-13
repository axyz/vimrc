" full vim
set nocompatible

" pathogen
call pathogen#infect()

"""""""""""""""""
"general settings

syntax on
filetype plugin indent on
let mapleader = ","

set modeline
set modelines=15
set scrolloff=3
set autoread
set autowrite
set showcmd
set hidden

set spelllang=en

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,tags,Session.vim

set iskeyword+=$,_

set number
set ruler
set cursorline
set nowrap
set linebreak
set showbreak=…
set backspace=start,indent,eol
set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set magic
set showmatch

set ttyfast
set fileformats=unix,mac,dos

set autoindent
set smartindent

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab

set visualbell
set noerrorbells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set nobackup
set nowritebackup
set noswapfile

set pastetoggle=<F7>
set listchars=tab:‣\ ,trail:-,extends:#,nbsp:%,eol:¬
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

if v:version >= 703
	set undodir=$HOME/.vim/.undo
	set undofile
	set undolevels=1000
	set undoreload=10000
	set colorcolumn=80
endif

set history=100

let g:explHideFiles='^\.,.*\.pyc$'

set showmode

set title

set laststatus=2
let g:Powerline_symbols='fancy'

set guioptions-=m
set guioptions-=T

set guioptions-=r
set guioptions-=L

set background=dark
colorscheme solarized

set foldenable
set foldmethod=manual
set foldlevel=99

" shortcuts
"""""""""""

inoremap jk <ESC>

" yank entire file (global yank)
nmap gy ggVGy

nnoremap ; :

nnoremap j gj
nnoremap k gk

map <c-s> :mksession! <cr>
map <c-o> :source Session.vim <cr>

" autocomplete shortcut to ctrol-space
imap <c-space> <c-x><c-o>

map <leader>w <C-W>w           " fast window switching
map <leader>. :b#<cr>          " cycle between buffers

" Vertical split then hop to new buffer
:noremap <leader>v :vsp<CR>
:noremap <leader>h :split<CR>

" Make current window the only one
:noremap <leader>O :only :tabo<CR>
:noremap <leader>o :only<CR>

" remap going through windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-c>j <c-w>j<c-w>c<c-w>k
map <c-c>k <c-w>k<c-w>c<c-w>j
map <c-c>l <c-w>l<c-w>c<c-w>h
map <c-c>h <c-w>h<c-w>c<c-w>l

"tabs
map <c-t>n :tabnew<cr>
map <c-t>h :tabprevious<cr>
map <c-t>j :tabnext<cr>
map <c-t>c :tabclose<cr>

" folds
:noremap <leader>zz zf%
:noremap <leader>zf f{zf%
:noremap zx za

" error next,previous (ctrl-{n,p})
:noremap <c-n> :cn<cr>
:noremap <c-p> :cp<cr>

" show invisible chars
nmap <silent> <leader>i :set nolist!<CR>

""""""""""""""""
" Plugin settings

" nerd tree
map <leader>d :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nm :NERDTreeMirror<CR>
let g:NERDChristmasTree=1

" taglist
nmap <F8> :TagbarToggle<CR>

" ctrlp plugin (because c-p is used for other things)
:noremap <c-p> :CtrlP<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': '',
  \ }

"localvimrc
let g:localvimrc_ask=0

" Gundo plugin
map <F6> :GundoToggle<cr>

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gl :Glog<cr>
map <leader>gd :Gdiff<cr>

" surround plugin
autocmd FileType php let b:surround_45 = "<?php \r ?>"

"""""""""""""""
" filetype specific

" remove trailing whitespace
autocmd FileType c,cpp,python,ruby,java,html,twig,css,scss,json,javascript
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


