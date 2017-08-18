" ======= NeoVim specific options ========
set clipboard=unnamedplus


" ======= Vundle Setup ========
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" Start - Vundle plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ervandew/supertab'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jpalardy/vim-slime'
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
Plugin 'w0rp/ale'
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

set mouse=a

" ======= Extension Settings ========
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline_extensions = ['hunks', 'branch', 'ale', 'virtualenv', 'whitespace', 'wordcount']
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_section_z = '%2c:%l/%L'
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 90,
  \ 'y': 120,
  \ }

let g:slime_default_config = {"sessionname": "repl", "windowname": "0"}
let g:slime_dont_ask_default = 1

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Disable auto-folding in Markdown
let g:vim_markdown_folding_disabled=1

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


" Python Settings
" ---------------

" Space, = does a Python format of the complete file.
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

" Set virtualenv for Neovim if it exists.
if filereadable(fnamemodify('~/.pyenv/versions/2.7.13/envs/neovim-2.7.13/bin/python', ':p'))
    let g:python_host_prog = fnamemodify('~/.pyenv/versions/2.7.13/envs/neovim-2.7.13/bin/python', ':p')
endif
if filereadable(fnamemodify('~/.pyenv/versions/3.5.2/envs/neovim-3.5.2/bin/python', ':p'))
    let g:python3_host_prog = fnamemodify('~/.pyenv/versions/3.5.2/envs/neovim-3.5.2/bin/python', ':p')
endif

