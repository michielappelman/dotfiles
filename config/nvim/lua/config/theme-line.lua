vim.o.termguicolors = true

-- Example config in Lua
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

vim.cmd [[colorscheme tokyonight]]

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    icons_enabled = true,
    section_separators = {"", ""},
    component_separators = {"", ""}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'diagnostics', sources = {'nvim_lsp'}}, {'filename'}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

vim.g.bufferline = {letters = 'ntserioalpufywmvckx'}

-- Map blankline
require("indent_blankline").setup {
  char = "│",
  show_first_indent_level = true,
  filetype_exclude = {
    "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit", "packer", "vimwiki", "markdown", "json",
    "txt", "vista", "help", "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
    "flutterToolsOutline", "" -- for all buffers without a file type
  },
  buftype_exclude = {"terminal", "nofile"},
  show_trailing_blankline_indent = false,
  show_current_context = true,
  context_patterns = {
    "class", "function", "method", "block", "list_literal", "selector", "^if", "^table", "if_statement", "while", "for",
    "type", "var", "import"
  }
}
