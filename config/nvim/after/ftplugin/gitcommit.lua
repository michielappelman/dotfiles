require('cmp').setup.buffer {sources = {{name = 'commit'}}}

vim.api.nvim_set_keymap('n', 'i', ':nunmap i<CR>ix<BS><C-Space>',
                        {noremap = false, silent = true})
