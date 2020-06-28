" ======== Theme Settings ==========
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set background=dark
endif

" ======= Shortcut remaps ========
let mapleader = " "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
"
" Quickly open/reload vim
nnoremap <leader>ev :tabe $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>   

" ======= Function Key remaps ========
" F6 to toggle paste mode
map <F6> :set invnumber<CR>
set pastetoggle=<F6>
" F7 to toggle paste mode
map <F7> :set invpaste<CR>
set pastetoggle=<F7>

" ======= Window / Tab settings ========
nmap <Leader>h :tabp <CR>
nmap <Leader>l :tabn <CR>

set switchbuf=usetab,newtab

if exists('+colorcolumn')
  set colorcolumn=100
  highlight ColorColumn ctermbg=1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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

set t_Co=256 " Ignored by nvim

" netrw Explorer settings
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
autocmd FileType netrw set nolist
