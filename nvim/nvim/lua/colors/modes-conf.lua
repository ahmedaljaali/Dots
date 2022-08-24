local utils = require('usr.utils')
local modes = utils.include('modes')

----------------------------------------------------------------------
--                           Modes config                           --

modes.setup({
    colors = {
        copy = '#d79921',
        delete = '#9d0006',
        insert = '#458588',
        visual = '#b16286',
    },

    -- Cursorline highlight opacity
    line_opacity = 0.3,

    -- Highlight cursor
    set_cursor = true,

    -- Highlight in active window only
    focus_only = false
})
----------------------------------------------------------------------
