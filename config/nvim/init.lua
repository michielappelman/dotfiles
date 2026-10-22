-- bootstrap lazy.nvim, LazyVim and your plugins
-- leaders must be set before lazy.nvim loads plugins that define <leader>/<localleader> maps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
