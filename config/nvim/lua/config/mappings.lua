-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.pastetoggle = "<F7>"

-- Hop mappings
vim.api.nvim_set_keymap('', '<leader>w',
                        "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
                        {})
vim.api.nvim_set_keymap('', '<leader>b',
                        "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
                        {})

-- Hop has not fixed behaviour yet with regards to including or excluding the character to hop to.
-- Issue: https://github.com/phaazon/hop.nvim/issues/82
-- vim.api.nvim_set_keymap('', 'f',
--                         "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
--                         {})
vim.api.nvim_set_keymap('', 'F',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
                        {})
vim.api.nvim_set_keymap('', 't',
                        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
                        {})
-- vim.api.nvim_set_keymap('', 'T',
--                         "<cmd>lua require'hop'.hint_char1({ direction = re'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
--                         {})

-- Function Keys Mapping
vim.api.nvim_set_keymap('', '<F2>', [[<Esc>:NvimTreeToggle<CR>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<F3>', [[<Esc>:LspTroubleToggle<CR>]],
--                         {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F4>', [[:set invnumber<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F5>', [[:Telescope<CR>]], {noremap = true, silent = true})

-- Ctrl+s is binded to save file
vim.api.nvim_set_keymap('n', '<C-s>', [[:w<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-s>', [[<Esc>:w<CR>i]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-s>', [[<Esc>:w<CR>]], {noremap = true, silent = true})

-- Buffer/Tab navigation
vim.api.nvim_set_keymap('n', '<C-w>', ':BufferClose<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'bb', ':BufferPick<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '[b', ':BufferPrevious<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', ']b', ':BufferNext<CR>', {silent = true, noremap = true})

-- Telescope Mappings
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sf',
                        [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so',
                        [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
                        {noremap = true, silent = true})

-- Small Deletes also go into numbered registers
-- based on: https://vi.stackexchange.com/questions/2493/can-i-make-vim-also-save-small-deletions-into-register-1/31321#31321
-- until Neovim gets https://github.com/neovim/neovim/pull/8169
-- associated with https://github.com/neovim/neovim/issues/8121
function SmallDeleteToNum()
  -- Also run highlighter
  require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})

  local e = vim.v.event
  if e.operator == 'y' then return end -- Don't care about actual yanks
  if e.regtype == 'V' then return end -- Vim already handles linewise deletions
  if #(e.regcontents) > 1 then return end -- Vim already handles deletions spanning multiple lines

  local deleted = e.regcontents[1]
  if #(deleted) == 1 then return end -- Don't want to catch single-character deletions

  -- Move current numbered registers down
  for i = 9, 2, -1 do
    local prev_reg = vim.api.nvim_call_function("getreg", {i - 1})
    vim.api.nvim_call_function("setreg", {i, prev_reg})
  end
  -- Add small deletion to register list
  vim.api.nvim_call_function("setreg", {1, deleted})
end

vim.cmd 'au TextYankPost * lua SmallDeleteToNum(event)'
