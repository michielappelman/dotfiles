" ======= NeoVim specific options ========
set clipboard=unnamedplus


" ======= Vundle Setup ========
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" Start - Vundle plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mhinz/vim-signify'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
" End - Vundle plugins
call vundle#end()
filetype plugin indent on
set updatetime=250
" ======= END Vundle Setup ========


" ======= Shortcut remaps ========
let mapleader = " "
map <Leader> <Plug>(easymotion-prefix)

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


" ======= Function Key remaps ========
map <F2> :NERDTreeToggle<CR>
" F6 to toggle paste mode
map <F6> :set invnumber<CR>
set pastetoggle=<F6>
" F7 to toggle paste mode
map <F7> :set invpaste<CR>
set pastetoggle=<F7>

" ======= Window / Tab Movement ========
" Map comma and dot to prev, next tab
nmap <C-l> :tabn <CR>
nmap <C-h> :tabp <CR>

" Easy window navigation
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l


" ======= Settings for vim ========
" Allow unsaved buffers to lose focus
set hidden
" Line numbers
set number
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Syntax HLing
syntax on
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
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "Auto indent
set si "Smart indent

set laststatus=2


if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:airline_powerline_fonts = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "💥"
let g:syntastic_style_error_symbol = "💥"
let g:syntastic_warning_symbol = "❗"
let g:syntastic_style_warning_symbol = "❗"
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height = 5
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticWarningSign guifg=white guibg=red

" Disable auto-folding in Markdown
let g:vim_markdown_folding_disabled=1


