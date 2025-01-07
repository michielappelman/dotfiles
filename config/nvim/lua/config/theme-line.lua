require('base16-colorscheme')

vim.cmd([[colorscheme base16-rose-pine-dawn]])

require("lualine").setup({
	options = {
		icons_enabled = true,
		globalstatus = true,
	},
})

require("ibl").setup()
