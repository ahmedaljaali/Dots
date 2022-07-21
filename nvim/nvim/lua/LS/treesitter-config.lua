local configs = require("usr.utils").import('nvim-treesitter.configs')

----------------------------------------------------------------------
--                            Tree sitter                            --

configs.setup {

    --for the matchup plugin
    matchup = {
        -- mandatory, false will disable the whole extension
        enable = true,

        -- optional, list of language that will be disabled
        disable = { "c", "ruby" },

    },
    ensure_installed = {
        "cpp",
        "json",
        "cmake",
        "markdown",
        "lua",
    },
    sync_install = true;

    -- enable highlighting
    highlight = {
        enable = true,
    },

    -- Rainbow configs
    rainbow = {
        enable = true,

        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for

        -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        extended_mode = true,

        -- Do not enable for files with more than n lines, int
        max_file_lines = nil,

        -- table of hex strings
        -- colors = {},

        -- table of colour name strings
        -- termcolors = {}
    },
    indent = {
    -- default is disabled anyways
    enable = false,
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                     Override the first color                     --

vim.cmd[[hi rainbowcol1 guifg=#7957cf]]
----------------------------------------------------------------------
