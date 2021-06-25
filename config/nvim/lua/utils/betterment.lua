-- Tree Sitter
require'nvim-treesitter.install'.compilers = {"clang"}
require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained",
    rainbow = {enable = true, extended_mode = true, max_file_lines = 1000},
    highlight = {enable = true},
    autotag = {enable = true}
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

-- nvim-comment
require('nvim_comment').setup({comment_empty = false})
