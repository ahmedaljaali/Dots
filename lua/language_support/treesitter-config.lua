local configs = require'nvim-treesitter.configs'
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
    indent = {
        enable = false, -- default is disabled anyways
    }
}
