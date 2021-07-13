-- Load external configs
require('config.formatter')
require('config.theme-line')

-- Install packer
local install_path = vim.fn.stdpath 'data' ..
                         '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                     install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use "ishan9299/nvim-solarized-lua"
  use "mhartington/formatter.nvim"
  use "folke/tokyonight.nvim"
  -- For statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Bufferline
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Git Signs
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }

  -- which-key
  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup {} end
  }
  -- Magit for Neovim
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    opt = false
  }

  -- Neovim motions on speed!
  use {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup {keys = 'neiotsradhgpfwjluymcxkbz'}
    end
  }

  -- For showing the actual color of the hex value
  use "norcalli/nvim-colorizer.lua"

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  use "p00f/nvim-ts-rainbow"
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use "kabouzeid/nvim-lspinstall"
  use "ray-x/lsp_signature.nvim"
  use "onsails/lspkind-nvim"
  use "kosayoda/nvim-lightbulb"
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use "folke/lua-dev.nvim"
end)

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.cmd [[set undofile]]

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'",
                        {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'",
                        {noremap = true, expr = true, silent = true})

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
require('telescope').setup {
  defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}
}

-- Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>',
                        [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sf',
                        [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sb',
                        [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sh',
                        [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>st',
                        [[<cmd>lua require('telescope.builtin').tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd',
                        [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp',
                        [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so',
                        [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?',
                        [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
                        {noremap = true, silent = true})

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- LSP settings
local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                              '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                              '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                              '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                              '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
                              '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa',
                              '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr',
                              '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
                              '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
                              '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                              '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                              '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
                              '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
                              '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
                              '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
                              '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q',
                              '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
                              [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
                              opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f',
                                "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<space>f',
                                "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
                                opts)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
local servers = {
  "gopls", "clangd", "pyright", "rust_analyzer", "tsserver", "efm",
  "sumneko_lua"
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {on_attach = on_attach, capabilities = capabilities}
end

local lspconfig = require('lspconfig')

local luadev = require("lua-dev").setup({})
lspconfig.sumneko_lua.setup(luadev)

local markdownlint = {
  lintCommand = "markdownlint -s",
  lintStdin = true,
  lintFormats = {"%f:%l:%c %m"}
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true, codeAction = false},
  settings = {languages = {markdown = {markdownlint}}},
  filetypes = {"markdown"}
}

-- Treesitter configuration
require'nvim-treesitter.install'.compilers = {"clang"}
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true -- false will disable the whole extension
  },
  ensure_installed = "maintained",
  rainbow = {enable = true, extended_mode = true, max_file_lines = 1000},
  autotag = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    }
  },
  indent = {enable = true},
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner'
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer'},
      goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer'},
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = {['[M'] = '@function.outer', ['[]'] = '@class.outer'}
    }
  }
}

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

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'

-- Compe setup
require('compe').setup {
  source = {
    path = true,
    nvim_lsp = true,
    luasnip = true,
    buffer = false,
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false
  }
}

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require 'luasnip'

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif luasnip.expand_or_jumpable() then
    return t '<Plug>luasnip-expand-or-jump'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif luasnip.jumpable(-1) then
    return t '<Plug>luasnip-jump-prev'
  else
    return t '<S-Tab>'
  end
end

-- Map tab to the above tab complete functiones
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', {expr = true})
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', {expr = true})

vim.o.pastetoggle = "<F7>"

-- Hop mappings
vim.api.nvim_set_keymap('', '<leader>w',
                        "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
                        {})
vim.api.nvim_set_keymap('', '<leader>b',
                        "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
                        {})

-- Hop has not fixed behaviour yet with regards to including or excluding the character to hop to.
-- Issue: https://github.com/phaazon/hop.nvim/issues/82
-- vim.api.nvim_set_keymap('', 'f',
--                         "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
--                         {})
vim.api.nvim_set_keymap('', 'F',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
                        {})
vim.api.nvim_set_keymap('', 't',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
                        {})
-- vim.api.nvim_set_keymap('', 'T',
--                         "<cmd>lua require'hop'.hint_char1({ direction = re'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
--                         {})

-- Function Keys Mapping
vim.api.nvim_set_keymap('', '<F2>', [[<Esc>:NvimTreeToggle<CR>]],
                        {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<F3>', [[<Esc>:LspTroubleToggle<CR>]],
--                         {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F4>', [[:set invnumber<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F5>', [[:Telescope<CR>]],
                        {noremap = true, silent = true})

-- Ctrl+s is binded to save file
vim.api.nvim_set_keymap('n', '<C-s>', [[:w<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-s>', [[<Esc>:w<CR>i]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-s>', [[<Esc>:w<CR>]],
                        {noremap = true, silent = true})

-- Ctrl+w is binded to save and close the buffer
vim.api.nvim_set_keymap('n', '<C-w>', [[:bn | bd#<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-w>', [[<Esc>:bn | bd#<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-w>', [[<Esc>:bn | bd#<CR>]],
                        {noremap = true, silent = true})

-- Navigate between Tabs
vim.api.nvim_set_keymap('n', ']b', '<cmd>BufferLineCycleNext<CR>',
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCyclePrev<CR>',
                        {silent = true, noremap = true})
