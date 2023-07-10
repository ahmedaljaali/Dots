local include = require('usr.utils').include
local configs = include('nvim-treesitter.configs')

----------------------------------------------------------------------
--                            Tree sitter                            --

configs.setup {

    --for the matchup plugin
    matchup = {
        -- mandatory, false will disable the whole extension
        enable = true,

        -- optional, list of language that will be disabled
        disable = { 'c', 'ruby' },
    },
    ensure_installed = {
        'cpp',
        'json',
        'cmake',
        'markdown',
        'lua',
        'glsl',
        'bash'
    },
    sync_install = true;

    -- enable highlighting
    highlight = {
        enable = true,
    },

    rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { 'jsx', 'cpp' },
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
        strategy = require('ts-rainbow').strategy.global,
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                     Override the first color                     --

vim.cmd[[hi rainbowcol1 guifg=#7957cf]]
----------------------------------------------------------------------
