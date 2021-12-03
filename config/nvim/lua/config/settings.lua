-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable mouse mode
vim.o.mouse = 'a'
vim.o.backup = false
vim.o.swapfile = false

vim.o.autoindent = true
vim.o.smartindent = true

vim.o.breakindent = true

vim.wo.colorcolumn = "80"

-- Save undo history
vim.cmd [[set undofile]]

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.conceallevel = 2

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 0

-- Filetype specific setttings
vim.cmd [[
filetype plugin on
autocmd FileType python setlocal tabstop=4 softtabstop=4 expandtab
]]

vim.cmd [[
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
]]
