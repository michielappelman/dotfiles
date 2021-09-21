-- Install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
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
  use {
    'TimUntersberger/neogit',
    requires = {'sindrets/diffview.nvim', 'nvim-lua/plenary.nvim'},
    opt = true,
    config = function()
      require("neogit").setup({disable_commit_confirmation = true, integrations = {diffview = true}})
    end
  }

  use 'folke/tokyonight.nvim'

  use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', opt = false}}
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = false}}
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  use {"phaazon/hop.nvim", config = function() require("hop").setup {keys = 'neiotsradhgpfwjluymcxkbz'} end}
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use {"folke/which-key.nvim", config = function() require("which-key").setup {} end}

  use 'lukas-reineke/indent-blankline.nvim'
  use 'mhartington/formatter.nvim'
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  use 'nvim-treesitter/nvim-treesitter'
  use "p00f/nvim-ts-rainbow"
  use 'nvim-treesitter/nvim-treesitter-textobjects'
end)

-- -- Load external configs
require('config.settings')
require('config.mappings')
require('config.theme-line')
require('config.treesitter')
require('config.formatter')

-- NvimTree
vim.g.nvim_tree_width = 25
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_ignore_ft = {'markdown'}
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_ignore = {'.git', '.DS_Store', 'node_modules', '.cache'}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_git_hl = 1
