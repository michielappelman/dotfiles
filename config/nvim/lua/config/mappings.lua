-- Function remap
local function noremap(mode, keys, command)
	vim.api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true })
end

-- Remap space as leader key
noremap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.pastetoggle = "<F7>"

noremap("n", "<c-left>", "<C-W><C-H>")
noremap("n", "<c-down>", "<C-W><C-J>")
noremap("n", "<c-up>", "<C-W><C-K>")
noremap("n", "<c-right>", "<C-W><C-L>")

-- Some cool remaps thanks to Primeagen: https://youtu.be/hSHATqh8svM
noremap("n", "n", "nzz")
noremap("n", "N", "Nzz")

noremap("n", "<s-up>", ":m .-2<cr>==")
noremap("n", "<s-down>", ":m .+1<cr>==")
noremap("v", "<s-up>", ":m '<-2<cr>gv=gv")
noremap("v", "<s-down>", ":m '>+1<cr>gv=gv")

noremap("i", ".", ".<c-g>u")
noremap("i", ",", ",<c-g>u")
noremap("i", "!", "!<c-g>u")
noremap("i", "?", "?<c-g>u")
noremap("i", ":", ":<c-g>u")
noremap("i", "<cr>", "<cr><c-g>u")

-- Function Keys Mapping
noremap("", "<F2>", [[<Esc>:NvimTreeToggle<CR>]])
noremap("", "<F5>", [[:Telescope<CR>]])

-- Ctrl+s is binded to save file
noremap("n", "<C-s>", [[:w<CR>]])
noremap("i", "<C-s>", [[<Esc>:w<CR>i]])
noremap("v", "<C-s>", [[<Esc>:w<CR>]])

-- Buffer/Tab navigation
noremap("n", "<C-q>", ":BufferClose<CR>")
noremap("n", "\\b", ":BufferPick<CR>")
noremap("n", "[b", ":BufferPrevious<CR>")
noremap("n", "]b", ":BufferNext<CR>")

-- Telescope Mappings
noremap("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
noremap("n", "<leader>sf", [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
noremap("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
noremap("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
noremap("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]])
noremap("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
noremap("n", "<leader>sp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
noremap("n", "<leader>so", [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
noremap("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])

-- Small Deletes also go into numbered registers
-- based on: https://vi.stackexchange.com/questions/2493/can-i-make-vim-also-save-small-deletions-into-register-1/31321#31321
-- until Neovim gets https://github.com/neovim/neovim/pull/8169
-- associated with https://github.com/neovim/neovim/issues/8121
function SmallDeleteToNum()
	-- Also run highlighter
	require("vim.highlight").on_yank({ higroup = "Search", timeout = 200 })

	local e = vim.v.event
	if e.operator == "y" then
		return
	end -- Don't care about actual yanks
	if e.regtype == "V" then
		return
	end -- Vim already handles linewise deletions
	if #e.regcontents > 1 then
		return
	end -- Vim already handles deletions spanning multiple lines

	local deleted = e.regcontents[1]
	if #deleted == 1 then
		return
	end -- Don't want to catch single-character deletions

	-- Move current numbered registers down
	for i = 9, 2, -1 do
		local prev_reg = vim.api.nvim_call_function("getreg", { i - 1 })
		vim.api.nvim_call_function("setreg", { i, prev_reg })
	end
	-- Add small deletion to register list
	vim.api.nvim_call_function("setreg", { 1, deleted })
end

vim.cmd("au TextYankPost * lua SmallDeleteToNum(event)")
