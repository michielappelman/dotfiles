vim.g.solarized_italics = 1
vim.g.solarized_visibility = 'low'
vim.g.solarized_statusline = 'low'

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.o.background = "light"
vim.cmd [[colorscheme solarized-high]]

require('lualine').setup {
  options = {theme = 'solarized_light'},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'diagnostics', sources = {'nvim_lsp'}}, {'filename'}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

-- Setup Tab bar
require'bufferline'.setup {
  options = {enforce_regular_tabs = true, always_show_bufferline = true, sort_by = 'extension'}
}
