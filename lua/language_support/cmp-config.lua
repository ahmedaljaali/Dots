  local cmp = require'cmp'
  local lspkind = require "lspkind"

cmp.setup({
 snippet = {
     expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1, group_index = 1},
        { name = 'vsnip', priority = 2, group_index = 1},
        { name = 'nvim_lua', priority = 3, group_index = 1},
        { name = "latex_symbols", priority = 5, group_index = 2},
        { name = "emoji", priority = 6, group_index = 2},
        { name = "calc", priority = 7, group_index = 2},
        { name = "path", priority = 8, group_index = 2},
        { name = 'spell', priority = 9, group_index = 2},
    }, {
      { name = 'cmp_tabnine', priority = 4, group_index = 2},
      { name = 'buffer', priority = 10, group_index = 4},
      { name = 'rg', priority = 11, group_index = 4},
    }),
    formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[path]",
        vsnip = "[Vsnip]",
        gh_issues = "[issues]",
        cmp_tabnine = "[TN]",
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

---------------------------------------------------------
--snippets dir
vim.g.vsnip_snippet_dir = "~/.config/nvim/lua/snips"
---------------------------------------------------------
