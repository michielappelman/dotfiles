require('base16-colorscheme')

vim.cmd([[colorscheme base16-rose-pine-dawn]])

require("lualine").setup({
	options = {
		icons_enabled = true,
		globalstatus = true,
	},
})

require("indent_blankline").setup({
	char = "│",
	show_first_indent_level = true,
	buftype_exclude = { "terminal" },
	show_current_context = true,
})
