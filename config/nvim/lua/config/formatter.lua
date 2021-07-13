-- Formatter Setup
require('formatter').setup({
  logging = false,
  filetype = {
    go = {
      -- gofmt
      function() return {exe = "gofmt", stdin = true} end
    },

    c = {
      -- clang-format
      function() return {exe = "clang-format", stdin = true} end

    },

    cpp = {
      -- clang-format
      function() return {exe = "clang-format", stdin = true} end

    },

    rust = {
      -- Rustfmt
      function()
        return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
      end
    },

    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'
          },
          stdin = true
        }
      end
    },

    lua = {
      -- lua-format
      function()
        return {
          exe = "lua-format",
          args = {"--indent-width=2", "--no-use-tab", "--tab-width=2"},
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
  autocmd BufWritePost *.go,*.c,*.cpp,*.js,*.rs,*.lua FormatWrite
augroup END
]], true)

