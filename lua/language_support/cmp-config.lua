  local cmp = require'cmp'
  local lspkind = require "lspkind"

cmp.setup({
 snippet = {
     expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'nvim_lua'},
        { name = "latex_symbols"},
        { name = "emoji"},
        { name = "calc"},
        { name = "path"},
        { name = 'spell'},
        { name = 'cmp_tabnine' },
    }, {
      { name = 'buffer' },
      { name = 'rg'},
    }),
    formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[path]",
        vsnip = "[snip]",
        gh_issues = "[issues]",
        cmp_tabnine = "[TN]",
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
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer", keyword_length = 2 },
    },
    enabled = function()
        return true
    end,
    completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
    },
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
    },
    sources = cmp.config.sources({
        { name = "path", keyword_length = 2 },
    }, {
        { name = "cmdline", keyword_length = 2 },
    }),
    enabled = function()
        return true
    end,
})
