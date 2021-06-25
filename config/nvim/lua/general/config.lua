--
-- Configurations
vim.o.termguicolors = true

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'

vim.g.mapleader = ' '

vim.o.mouse = "a"

vim.o.hidden = true
vim.wo.number = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.showmatch = true

vim.o.backup = false
vim.o.swapfile = false

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.o.autochdir = true

vim.o.autoindent = true
vim.o.smartindent = true

vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir/"

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noinsert"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 10

vim.o.showcmd = true
vim.o.ignorecase = true
-- vim.o.pumheight = 15
vim.o.title = true
vim.o.titlestring = "%<%F%=%l/%L - nvim"

vim.o.updatetime = 300
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)
