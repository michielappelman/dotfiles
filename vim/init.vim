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
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ervandew/supertab'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mhinz/vim-signify'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'pearofducks/ansible-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmux-plugins/vim-tmux'
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
"
" Quickly open/reload vim
nnoremap <leader>ev :tabe $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>   

" ======= Function Key remaps ========
map <F2> :NERDTreeToggle<CR>
map <F3> :Errors<CR>
" F6 to toggle paste mode
map <F6> :set invnumber<CR>
set pastetoggle=<F6>
" F7 to toggle paste mode
map <F7> :set invpaste<CR>
set pastetoggle=<F7>

" ======= Window / Tab Movement ========
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <Leader>, :tabp <CR>
nmap <Leader>. :tabn <CR>

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
  set colorcolumn=100
  highlight ColorColumn ctermbg=1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:airline_powerline_fonts = 1

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = "💥"
let g:syntastic_loc_list_height = 5
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_warning_symbol = '⚠️'
highlight SyntasticErrorLine guifg=white guibg=red
highlight SyntasticWarningLine guifg=white guibg=red
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticWarningSign guifg=white guibg=red

" Disable auto-folding in Markdown
let g:vim_markdown_folding_disabled=1


