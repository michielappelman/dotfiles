-- Formatter Setup
require('formatter').setup({
  logging = false,
  filetype = {
    go = {function() return {exe = "gofmt", stdin = true} end},
    c = {function() return {exe = "clang-format", stdin = true} end},
    cpp = {function() return {exe = "clang-format", stdin = true} end},
    rust = {function() return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true} end},
    markdown = {
      function()
        return {
          exe = "prettier",
          args = {'--parser markdown', '--stdin-filepath "', vim.api.nvim_buf_get_name(0), '"'},
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = {'--parser typescript', '--stdin-filepath "', vim.api.nvim_buf_get_name(0), '"'},
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = "lua-format",
          args = {"--indent-width=2", "--no-use-tab", "--tab-width=2", "--column-limit=120"},
          stdin = true
        }
      end
    }
  }
})

-- Autoformat on Save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.go,*.c,*.cpp,*.js,*.rs,*.lua,*.md FormatWrite
augroup END
]], true)
