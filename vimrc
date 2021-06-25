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
Plug 'ekalinin/Dockerfile.vim'
Plug 'pearofducks/ansible-vim'
Plug 'mitsuhiko/vim-jinja'
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

" Markdown Settings
" ---------------
autocmd FileType markdown,mkd setl fdl=6 tw=0 linebreak breakindent
                          \ | set conceallevel=2
                          \ | let g:vim_markdown_strikethrough = 1
                          \ | let g:vim_markdown_toc_autofit = 1
                          \ | let g:vim_markdown_folding_disabled=1
                          \ | let g:vim_markdown_auto_insert_bullets = 1
                          \ | let g:vim_markdown_new_list_item_indent = 1
                          \ | let g:vim_markdown_edit_url_in = 'tab'
                          \ | let g:vim_markdown_conceal_code_blocks = 0

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
