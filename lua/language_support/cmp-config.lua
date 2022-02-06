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
        { name = 'nvim_lua', priority = 11 },
        { name = 'rg', priority = 12, keyword_length = 4 },
        { name = 'spell', priority = 13 },
        { name = "buffer", priority = 7, keyword_length = 4 },
        { name = "path", priority = 5 },
        { name = "emoji", priority = 3 },
        { name = "calc", priority = 4 },
        { name = "nvim_lsp", priority = 9 },
        { name = "luasnip", priority = 8 },
        { name = "latex_symbols", priority = 1 },
        { name = "nvim_lsp_signature_help", priority = 10 },
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
