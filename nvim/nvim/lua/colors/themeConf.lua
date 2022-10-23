local include = require('usr.utils').include
local oneDark = include('onedark')

----------------------------------------------------------------------
--                        configure onedark                         --


oneDark.setup  {

    -- toggle theme style ---
    toggle_style_key = '<leader>ts', -- Default keybinding to toggle

    -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    style = 'dark',

      -- Show/hide background
    transparent = false,

    -- Change terminal color as per the selected theme style
    term_colors = true,

    -- Show the end-of-buffer tildes. By default they are hidden
    ending_tildes = false,

    -- toggle theme style ---
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        -- darker colors for diagnostic
        darker = true,

         -- use undercurl for diagnostics
        undercurl = true,

        -- use background color for virtual text
        background = true,
    },

 }
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Set theme                             --


-- require('onedark').load() --enable one dark
--
vim.o.background = 'dark' -- or 'light' for light mode

vim.cmd([[colorscheme gruvbox]])
----------------------------------------------------------------------
