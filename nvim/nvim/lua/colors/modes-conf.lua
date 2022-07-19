local modes = require('modes')

----------------------------------------------------------------------
--                           Modes config                           --

modes.setup({
    colors = {
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#78ccc5",
        visual = "#9745be",
    },

    -- Cursorline highlight opacity
    line_opacity = 0.3,

    -- Highlight cursor
    set_cursor = true,

    -- Highlight in active window only
    focus_only = false
})
----------------------------------------------------------------------
