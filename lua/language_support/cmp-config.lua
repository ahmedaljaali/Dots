  local cmp = require'cmp'
  local lspkind = require "lspkind"
  local luasnip = require "luasnip"


cmp.setup({
 snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp', priority = 1},
      { name = 'nvim_lua' },
      { name = 'rg' },
      { name = 'luasnip' },
      { name = "latex_symbols" },
      { name = 'calc' },
      { name = 'emoji' },
      { name = 'spell' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'cmdline' },
      { name = "nvim_lsp_signature_help"},
    }),

    formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
      },
    },
  },
      sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
