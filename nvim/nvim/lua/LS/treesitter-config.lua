local utils = require('usr.utils')
local configs = utils.include('nvim-treesitter.configs')

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
        'query',
        'glsl'
    },
    sync_install = true;

    -- enable highlighting
    highlight = {
        enable = true,
    },

    -- Rainbow configs
    rainbow = {
        enable = true,

        -- disable = { 'jsx', 'cpp' }, list of languages you want to disable the plugin for

        -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        extended_mode = true,

        -- Do not enable for files with more than n lines, int
        max_file_lines = nil,

        -- table of hex strings
        -- colors = {},

        -- table of colour name strings
        -- termcolors = {}
    },
    -- Setup treesitter playground
    playground = {
        enable = true,
        disable = {},

        -- Debounced time for highlighting nodes in the playground from source code
        updatetime = 25,

        -- Whether the query persists across vim sessions
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    -- The playground lint query
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {'BufWrite', 'CursorHold'},
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
