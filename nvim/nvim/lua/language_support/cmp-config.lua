  local cmp = require'cmp'
  local lspkind = require "lspkind"

local function enableSpelling()
  if require"cmp.config.context".in_treesitter_capture("comment")==true
      or require"cmp.config.context".in_syntax_group("Comment") then
    return  { name = 'spell', priority = 1, group_index = 1}
  else
      return {}
  end
end

cmp.setup({
 snippet = {
     expand = function(args)
    local luasnip = require("luasnip")
    if not luasnip then
        return
    end
    luasnip.lsp_expand(args.body)
    end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1, group_index = 1},
        { name = 'luasnip', priority = 2, group_index = 1},
        { name = "emoji", priority = 4, group_index = 2},
        { name = "latex_symbols", priority = 5, group_index = 2},
        { name = "calc", priority = 6, group_index = 2},
        { name = "path", priority = 7, group_index = 2},
    }, {
      { name = 'spell', priority = 8, group_index = 2},
      { name = 'cmp_tabnine', priority = 8, group_index = 2},
    }),
    formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip= "[luasnip]",
        gh_issues = "[issues]",
        cmp_tabnine = "[TN]",
        spell = '[spell]'
      },
    },
  },
      sorting = {
        comparators = {
            cmp.config.compare.offset, cmp.config.compare.exact,
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
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
