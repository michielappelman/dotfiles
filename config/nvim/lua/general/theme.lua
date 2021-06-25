vim.g.solarized_italics = 1
vim.g.solarized_visibility = 'low'
vim.g.solarized_statusline = 'low'

require('lualine').setup {
  options = {theme = 'solarized_light'},
  -- options = {theme = 'tokyonight'},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'diagnostics', sources = {'nvim_lsp'}}, {'filename'}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

vim.cmd('colorscheme solarized-high')
-- vim.cmd('colorscheme tokyonight')
vim.o.background = "light"
