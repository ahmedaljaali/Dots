local include = require('usr.utils').include
local hlargs = include('hlargs')

----------------------------------------------------------------------
--                           Setup Hlags                            --

hlargs.setup {
    color =  '#83a598',

    excluded_filetypes = {},

    paint_arg_declarations = true,

    paint_arg_usages = true,

    paint_catch_blocks = {
        declarations = true,
        usages = true
    },

    extras = {
        named_parameters = true,
    },

    performance = {
        parse_delay = 1,
        max_iterations = 500
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                   Enable, disable or toggle it                   --

-- require('hlargs').enable()
-- require('hlargs').disable()
-- require('hlargs').toggle()
----------------------------------------------------------------------
