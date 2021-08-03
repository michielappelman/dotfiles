-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.backup = false
vim.o.swapfile = false

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.o.autoindent = true
vim.o.smartindent = true

vim.o.breakindent = true

vim.wo.colorcolumn = "120"

-- Save undo history
vim.cmd [[set undofile]]

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
