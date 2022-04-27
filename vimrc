" ======= Shortcut remaps ========
let mapleader = " "

" saving of files as sudo
cmap w!! w !sudo tee > /dev/null %

" Quickly open/reload vim
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

map <F2> :Vexplore<CR>
map <F4> :set invnumber<CR>
nnoremap <F6> :buffers<CR>:buffer<Space>
set pastetoggle=<F7>

" Navigating
nnoremap <Leader><Left> :bp<CR>
nnoremap <Leader><Right> :bn<CR>
nnoremap <Leader>b :e#<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Cosmetic
Plug 'overcache/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language specific
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'psf/black'

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
call plug#end()

" ======== Theme Settings ==========
if exists('+termguicolors')
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
  colorscheme NeoSolarized
  set background=light
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
endif

" netrw Explorer settings
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
autocmd FileType netrw set nolist

" ====== easymotion mappings =======
let g:EasyMotion_do_mapping = 0
map <Leader> <Plug>(easymotion-prefix)
" Jump to anywhere with only `s{char}{target}`
nmap s <Plug>(easymotion-s)
nmap w <Plug>(easymotion-bd-w)
" Bidirectional & within line f and t motions
omap t <Plug>(easymotion-bd-tl)
omap f <Plug>(easymotion-bd-fl)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

set mouse=a

" ======= General Settings ========
" Allow unsaved buffers to lose focus
set hidden
" Line numbers
set number
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Syntax HLing
syntax enable
" Show matching brackets when text indicator is over them
set showmatch
" Tab completion
set wildmode=longest,list,full
set wildmenu
" Scroll earlier then end of screen
set scrolloff=10
" Auto change directory
set autochdir
" How many tenths of a second to blink when matching brackets
set mat=5
"Always show current position
set ruler
" Set to auto read when a file is changed from the outside
set autoread
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Be smart when using tabs ;)
set smarttab

" Use spaces instead of tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=0

set ai "Auto indent
set si "Smart indent
