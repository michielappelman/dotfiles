vim.o.termguicolors = true

vim.cmd [[colorscheme base16-rose-pine-dawn]]

require('lualine').setup {
  options = {
    theme = 'papercolor',
    icons_enabled = true,
    section_separators = {"", ""},
    component_separators = {"", ""}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'diagnostics', sources = {'nvim_diagnostic'}}, {'filename'}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

require("indent_blankline").setup {
  char = "│",
  show_first_indent_level = true,
  buftype_exclude = {"terminal"},
  show_current_context = true
}
