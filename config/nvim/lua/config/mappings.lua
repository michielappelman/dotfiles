local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<c-left>", "<C-W><C-H>")
vim.keymap.set("n", "<c-down>", "<C-W><C-J>")
vim.keymap.set("n", "<c-up>", "<C-W><C-K>")
vim.keymap.set("n", "<c-right>", "<C-W><C-L>")

vim.keymap.set("t", "<A-q>", "<C-\\><C-n>", opts)
vim.keymap.set("t", "<A-left>", "<C-\\><C-W><C-H>")
vim.keymap.set("t", "<A-down>", "<C-\\><C-W><C-J>")
vim.keymap.set("t", "<A-up>", "<C-\\><C-W><C-K>")
vim.keymap.set("t", "<A-right>", "<C-\\><C-W><C-L>")

-- Some cool remaps thanks to Primeagen: https://youtu.be/hSHATqh8svM
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<s-up>", ":m .-2<cr>==")
vim.keymap.set("n", "<s-down>", ":m .+1<cr>==")
vim.keymap.set("v", "<s-up>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<s-down>", ":m '>+1<cr>gv=gv")

vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
vim.keymap.set("i", ":", ":<c-g>u")
vim.keymap.set("i", "<cr>", "<cr><c-g>u")

-- Function Keys Mapping
vim.keymap.set("", "<F2>", [[<Esc>:NvimTreeToggle<CR>]])
vim.keymap.set("", "<F5>", [[:Telescope<CR>]])

-- Ctrl+s is binded to save file
vim.keymap.set("n", "<C-s>", [[:w<CR>]])
vim.keymap.set("i", "<C-s>", [[<Esc>:w<CR>i]])
vim.keymap.set("v", "<C-s>", [[<Esc>:w<CR>]])

-- Buffer/Tab navigation
vim.keymap.set("n", "<C-q>", ":close<CR>")
vim.keymap.set("n", "\\b", ":BufferPick<CR>")
vim.keymap.set("n", "[b", ":BufferPrevious<CR>")
vim.keymap.set("n", "]b", ":BufferNext<CR>")

-- Telescope Mappings
vim.keymap.set("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set("n", "<leader>sf", [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
vim.keymap.set("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
vim.keymap.set("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
vim.keymap.set("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]])
vim.keymap.set("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
vim.keymap.set("n", "<leader>sp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
vim.keymap.set("n", "<leader>so", [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
vim.keymap.set("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])

-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	pattern = "*",
-- 	desc = "Add small delete to numbered register",
-- 	-- based on: https://vi.stackexchange.com/questions/2493/can-i-make-vim-also-save-small-deletions-into-register-1/31321#31321
-- 	-- until Neovim gets https://github.com/neovim/neovim/pull/8169
-- 	-- associated with https://github.com/neovim/neovim/issues/8121
-- 	callback = function()
-- 		-- Also run highlighter
-- 		require("vim.highlight").on_yank({ higroup = "Search", timeout = 200 })
--
-- 		local e = vim.v.event
-- 		if e.operator == "y" then -- Don't care about actual yanks
-- 			return
-- 		end
-- 		if e.regtype == "V" then -- Vim already handles linewise deletions
-- 			return
-- 		end
-- 		if #e.regcontents > 1 then -- Vim already handles deletions spanning multiple lines
-- 			return
-- 		end
--
-- 		local deleted = e.regcontents[1]
-- 		if #deleted == 1 then -- Don't want to catch single-character deletions
-- 			return
-- 		end
--
-- 		-- Move current numbered registers down
-- 		for i = 9, 2, -1 do
-- 			local prev_reg = vim.api.nvim_call_function("getreg", { i - 1 })
-- 			vim.api.nvim_call_function("setreg", { i, prev_reg })
-- 		end
-- 		-- Add small deletion to register list
-- 		vim.api.nvim_call_function("setreg", { 1, deleted })
-- 	end,
-- })
