-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
  use 'karb94/neoscroll.nvim'
  use 'tpope/vim-commentary'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use "ishan9299/nvim-solarized-lua"
  use 'projekt0n/github-nvim-theme'
  use "mhartington/formatter.nvim"
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }
  use {"folke/which-key.nvim", config = function() require("which-key").setup {} end}
  use {'TimUntersberger/neogit', requires = {'sindrets/diffview.nvim', 'nvim-lua/plenary.nvim'}, opt = false}
  use {"phaazon/hop.nvim", config = function() require("hop").setup {keys = 'neiotsradhgpfwjluymcxkbz'} end}
  use "norcalli/nvim-colorizer.lua"

  use 'nvim-treesitter/nvim-treesitter'
  use "p00f/nvim-ts-rainbow"
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use "kabouzeid/nvim-lspinstall"
  use "ray-x/lsp_signature.nvim"
  use "onsails/lspkind-nvim"
  use "kosayoda/nvim-lightbulb"
  use 'L3MON4D3/LuaSnip'
  use "folke/lua-dev.nvim"
end)

-- Load external configs
require('config.settings')
require('config.mappings')
require('config.theme-line')
require('config.treesitter')
require('config.lsp-compe-snip')
require('config.formatter')

-- Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = {'help', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = {hl = 'GitGutterAdd', text = '+'},
    change = {hl = 'GitGutterChange', text = '~'},
    delete = {hl = 'GitGutterDelete', text = '_'},
    topdelete = {hl = 'GitGutterDelete', text = '‾'},
    changedelete = {hl = 'GitGutterChange', text = '~'}
  }
}

-- Telescope
require('telescope').setup {defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}}

require("neogit").setup({
  disable_commit_confirmation = true,
  integrations = {diffview = true},
  mappings = {status = {["B"] = "BranchPopup"}}
})

-- NvimTree
vim.g.nvim_tree_width = 25
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_ignore = {'.git', '.DS_Store', 'node_modules', '.cache'}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_git_hl = 1

-- Colorizer
require'colorizer'.setup({'html', 'css', 'javascript'}, {
  RGB = true,
  RRGGBB = true,
  RRGGBBAA = true,
  rgb_fn = true,
  hsl_fn = true,
  css = true,
  css_fn = true
})
