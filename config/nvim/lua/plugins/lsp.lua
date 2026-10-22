return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "gD", vim.lsp.buf.declaration, desc = "Goto declaration" },
      { "gi", vim.lsp.buf.implementation, desc = "Goto implementation" },
      { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "Add workspace folder" },
      { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove workspace folder" },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "List workspace folders",
      },
      { "<leader>D", vim.lsp.buf.type_definition, desc = "Type definition" },
      { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
    },
    opts = {
      diagnostics = {
        virtual_text = { prefix = "●" },
        update_in_insert = true,
        float = { source = "always" },
      },
      servers = {
        gopls = {
          cmd = { "gopls", "serve" },
          filetypes = { "go", "gomod" },
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
        pyright = {},
        ts_ls = {},
        jsonls = {},
      },
    },
  },
}
