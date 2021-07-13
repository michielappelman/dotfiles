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

-- Setup Tab bar
require'bufferline'.setup {
  options = {
    -- view = "multiwindow",
    -- numbers = "buffer_id",
    -- number_style = "superscript",
    -- mappings = true,
    -- buffer_close_icon = '',
    -- modified_icon = '●',
    -- close_icon = '',
    -- left_trunc_marker = '',
    -- right_trunc_marker = '',
    -- max_name_length = 18,
    -- max_prefix_length = 15,
    -- tab_size = 20,
    -- diagnostics = "nvim_lsp",
    -- show_buffer_close_icons = true,
    -- show_close_icon = true,
    -- show_tab_indicators = true,
    -- persist_buffer_sort = true,
    -- separator_style = "thin",
    -- enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'extension'
  }
}

