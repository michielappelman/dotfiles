set clipboard=unnamedplus

if !has('nvim')
	set term=xterm-256color
endif

let g:loaded_python_provider = 0
let g:python3_host_prog = '/Users/mappelma/.pyenv/versions/tools3/bin/python'

call plug#begin('~/.config/nvim/bundle')
" Cosmetic
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'

" Language specific
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'tmux-plugins/vim-tmux'
Plug 'ekalinin/Dockerfile.vim'
Plug 'pearofducks/ansible-vim'
Plug 'mitsuhiko/vim-jinja'

" Python
Plug 'psf/black'
Plug 'davidhalter/jedi-vim'

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdcommenter'

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'jlanzarotta/bufexplorer'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Code
Plug 'ervandew/supertab'
Plug 'jpalardy/vim-slime'
call plug#end()

" ======== Theme Settings ==========
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  colorscheme NeoSolarized
  set background=dark
  let g:neosolarized_contrast = "high"
endif

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

" ======= Window / Tab settings ========
nmap <Leader>h :tabp <CR>
nmap <Leader>l :tabn <CR>

set switchbuf=usetab,newtab

let g:bufExplorerDefaultHelp=0

if exists('+colorcolumn')
  set colorcolumn=100
  highlight ColorColumn ctermbg=1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


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
let g:airline_extensions = ['hunks', 'branch', 'whitespace', 'wordcount']
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_section_z = '%2c:%l/%L'
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 90,
  \ 'y': 120,
  \ }

let g:slime_default_config = {"sessionname": "repl", "windowname": "0"}
let g:slime_dont_ask_default = 1

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

set t_Co=256 " Ignored by nvim

" netrw Explorer settings
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
autocmd FileType netrw set nolist

" Markdown Settings
" ---------------
autocmd FileType markdown setlocal tw=100 fo+=t
let g:vim_markdown_toc_autofit = 1

" Python Settings
" ---------------

" Space, = does a Python format of the complete file.
autocmd FileType python nnoremap <Leader>= :Black<CR>
autocmd BufWritePre *.py execute ':Black'

" Go Settings
" ---------------
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "camelcase"

" vim-go
augroup vg
"au FileType go nmap <Leader>b :GoBuild<CR>
"au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <Leader>cr :GoCallers<CR>
au FileType go nmap <Leader>ce :GoCallees<CR>
au FileType go nmap <Leader>? :GoCoverageToggle<CR>
au FileType go nmap <Leader>D :GoDefPop<CR>
au FileType go nmap <Leader>v :GoImplements<CR>
au FileType go nmap <Leader>I :GoImports<CR>
au FileType go nmap <Leader>i :GoInstall<CR>
au FileType go nmap <Leader>p :GoPlay<CR>
au FileType go nmap <Leader>' :GoDocBrowser<CR>
au FileType go nmap <Leader>b :GoToggleBreakpoint<CR>
au FileType go nmap <Leader>db :GoDebug<CR>
au FileType go nmap <Leader>e :Refactor extract

au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

au FileType go nmap <Leader>,, :GoAlternate<CR>
au FileType go nmap <Leader>T :GoTestFunc
au FileType go nmap <Leader>t :GoTest
au FileType go nmap <Leader>r :GoReferrers<CR>
au FileType go nmap <Leader>cp :GoChannelPeers<CR>
au FileType go nmap <Leader>d :GoDef<CR>
au FileType go nmap <Leader>k :GoInfo<CR>

augroup END

