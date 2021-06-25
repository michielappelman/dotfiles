-- Setup Tab bar
require'bufferline'.setup {
  options = {
    -- view = "multiwindow",
    numbers = "buffer_id",
    number_style = "superscript",
    mappings = true,
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 20,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'extension'
  }
}

-- Navigate between Tabs
vim.api.nvim_set_keymap('n', ']b', '<cmd>BufferLineCycleNext<CR>',
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCyclePrev<CR>',
                        {silent = true, noremap = true})
