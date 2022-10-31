-- LSP settings
local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], bufopts)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- vim.cmd([[
	--            augroup LspFormatting
	--                autocmd! * <buffer>
	--                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	--            augroup END
	--            ]])
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Formatter Setup
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.rustfmt,
		-- require("null-ls").builtins.diagnostics.eslint_d.with({
		-- 	prefer_local = "node_modules/.bin",
		-- }),
		require("null-ls").builtins.diagnostics.gitlint,
		require("null-ls").builtins.diagnostics.luacheck,
		require("null-ls").builtins.diagnostics.shellcheck,
		require("null-ls").builtins.diagnostics.trail_space,
		-- require("null-ls").builtins.code_actions.eslint_d,
		require("null-ls").builtins.code_actions.gitsigns,
	},
	on_attach = on_attach,
})

-- Enable the following language servers
local servers = { "gopls", "pyright", "tsserver", "jsonls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
end

lspconfig["gopls"].setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
	on_attach = on_attach,
})

lspconfig["jsonls"].setup({
	settings = { json = { schemas = require("schemastore").json.schemas() } },
	on_attach = on_attach,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
