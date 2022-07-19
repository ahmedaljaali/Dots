local configs = require'nvim-treesitter.configs'

----------------------------------------------------------------------
--                            Tree sitter                            --

configs.setup {
    matchup = { --for the matchup plugin
        enable = true,              -- mandatory, false will disable the whole extension
        disable = { "c", "ruby" },  -- optional, list of language that will be disabled
        -- [options]
    },
    ensure_installed = {
        "cpp",
        "json",
        "cmake",
        "markdown",
        "lua",
    },
    sync_install = true;
    highlight = { -- enable highlighting
        enable = true,
    },

    -- Rainbow configs
    rainbow = {
        enable = true,

        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for

        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean

        max_file_lines = nil, -- Do not enable for files with more than n lines, int

        -- colors = {}, -- table of hex strings

        -- termcolors = {} -- table of colour name strings
    },
    indent = {
        enable = false, -- default is disabled anyways
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                     Override the first color                     --

vim.cmd[[hi rainbowcol1 guifg=#7957cf]]
----------------------------------------------------------------------
