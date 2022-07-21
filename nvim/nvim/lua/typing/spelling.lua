local spellchecking = require("usr.utils").import('spellsitter')

----------------------------------------------------------------------
--                           Spellsitter                            --

spellchecking.setup {
    -- Whether enabled, can be a list of file types, e.g. {'python', 'lua'}
    enable = true,
    debug = false
}
----------------------------------------------------------------------
