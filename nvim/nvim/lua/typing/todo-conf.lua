local todo = require("todo-comments")



----------------------------------------------------------------------
--                              Setup                               --

todo.setup
{
    -- show icons in the signs column
    signs = true,

    -- sign priority
    sign_priority = 8,

    -- keywords recognized as todo comments
    keywords = {
        FIX = {
             -- icon used for the sign, and in search results
            icon = " ",

            -- can be a hex color, or a named color (see below)
            color = "error",

            -- a set of other keywords that all map to this FIX keywords
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },

    -- when true, custom keywords will be merged with the defaults
    merge_keywords = true,
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
         -- "fg" or "bg" or empty
        before = "",

         -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        keyword = "wide",

        -- "fg" or "bg" or empty
        after = "fg",

        -- pattern or table of patterns, used for highlightng (vim regex)
        pattern = [[.*<(KEYWORDS)\s*:]],

        -- uses treesitter to match keywords in comments only
        comments_only = true,

        -- ignore lines longer than this
        max_line_len = 400,

        -- list of file types to exclude highlighting
        exclude = {},
    },

    -- list of named colors where we try to extract the guifg from the
    -- list of hilight groups or use the hex color if hl not found as a fallback
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
    },
    search = {
    command = "rg",
    args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    -- ripgrep regex
    pattern = [[\b(KEYWORDS):]],
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
}
----------------------------------------------------------------------
