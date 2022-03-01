-- Install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd("packadd packer.nvim")
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

local use = require("packer").use
require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	})

	-- Git
	use({
		"TimUntersberger/neogit",
		requires = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
		opt = false,
		config = function()
			require("neogit").setup({
				disable_hint = true,
				disable_commit_confirmation = true,
				disable_insert_on_commit = true,
				integrations = { diffview = true },
			})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				open_on_setup = true,
				update_cwd = true,
				ignore_ft_on_setup = { "markdown" },
				view = { auto_resize = true, width = 25, side = "left" },
				update_focused_file = {
					enable = true,
					update_cwd = true,
					ignore_list = { ".git", ".DS_Store", "node_modules", ".cache" },
				},
			})
		end,
	})
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = false },
	})
	use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use({
		"ggandor/lightspeed.nvim",
		requires = { "tpope/vim-repeat" },
		config = function()
			require("lightspeed").setup({
				exit_after_idle_msecs = { labeled = 1000, unlabeled = 2500 },
				match_only_the_start_of_same_char_seqs = true,
				limit_ft_matches = 6,
				substitute_chars = { ["\r"] = "¬" },
			})
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-surround")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	-- markdown
	use({ "plasticboy/vim-markdown", requires = "godlygeek/tabular" })

	-- Snippets
	use({ "L3MON4D3/luasnip", requires = { "rafamadriz/friendly-snippets" } })

	-- LSP
	use("neovim/nvim-lspconfig")
	use("b0o/schemastore.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("lukas-reineke/cmp-rg")
	use("onsails/lspkind-nvim")

	use("nvim-treesitter/nvim-treesitter")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter-textobjects")
end)

require("telescope").load_extension("projects")

-- -- Load external configs
require("config.settings")
require("config.mappings")
require("config.theme-line")
require("config.completion")
require("config.treesitter")
require("config.lsp")
