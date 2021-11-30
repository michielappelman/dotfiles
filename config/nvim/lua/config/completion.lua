local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()
vim.api.nvim_command('hi LuasnipChoiceNodePassive cterm=italic')

cmp.setup({
  snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
  formatting = {format = lspkind.cmp_format({with_text = false, maxwidth = 50})},
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },
  sources = {{name = 'luasnip'}, {name = 'buffer'}, {name = 'path'}, {name = 'nvim_lua'}, {name = 'rg'}}
})
