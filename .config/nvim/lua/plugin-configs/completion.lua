  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
 
  local cmp = require'cmp'
  local compare = require('cmp.config.compare')

  cmp.setup({
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ 
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4)
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' }
    },
    sorting = {
        priority_weight = 2,
        comparators = {
          compare.exact,
          compare.offset,
          compare.score,
          compare.sort_text,
          compare.length,
          compare.kind,
          compare.order
        },
    }
})
