local hlargs = require("usr.utils").import('hlargs')

----------------------------------------------------------------------
--                           Setup Hlags                            --

hlargs.setup {
    color =  "#83a598",
    excluded_filetypes = {},
    paint_arg_declarations = true,
    paint_arg_usages = true,
    performance = {
        parse_delay = 1,
        max_iterations = 400
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                   Enable, disable or toggle it                   --

-- require('hlargs').enable()
-- require('hlargs').disable()
-- require('hlargs').toggle()
----------------------------------------------------------------------
