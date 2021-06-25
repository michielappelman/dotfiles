-- open spectre
vim.api.nvim_set_keymap('', '<leader>S', [[:lua require('spectre').open()<CR>]],
                        {noremap = true, silent = true})

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
vim.api.nvim_set_keymap('', '<F2>', [[<Esc>:NvimTreeToggle<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F3>', [[<Esc>:LspTroubleToggle<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F4>', [[:set invnumber<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F5>', [[:Telescope<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<F6>', [[:Telescope buffers<CR>]],
                        {noremap = true, silent = true})

-- Ctrl+s is binded to save file
vim.api.nvim_set_keymap('n', '<C-s>', [[:w<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-s>', [[<Esc>:w<CR>i]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-s>', [[<Esc>:w<CR>]],
                        {noremap = true, silent = true})

-- Ctrl+w is binded to save and close the buffer
vim.api.nvim_set_keymap('n', '<C-w>', [[:bn | bd#<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-w>', [[<Esc>:bn | bd#<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-w>', [[<Esc>:bn | bd#<CR>]],
                        {noremap = true, silent = true})
