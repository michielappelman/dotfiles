vim.o.termguicolors = true
vim.o.background = "light"

require("github-theme").setup({themeStyle = "light", functionStyle = "italic", sidebars = {"terminal", "packer"}})

require('lualine').setup {
  options = {
    theme = 'github',
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

vim.opt_local.scrolloff = 0
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  hide_cursor = true,
  stop_eof = false,
  use_local_scrolloff = false,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  easing_function = "cubic",
  pre_hook = nil,
  post_hook = nil
})
