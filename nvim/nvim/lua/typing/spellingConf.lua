local include = require('usr.utils').include
local spellchecking = include('spellsitter')

----------------------------------------------------------------------
--                           Spellsitter                            --

spellchecking.setup {
    -- Whether enabled, can be a list of file types, e.g. {'python', 'lua'}
    enable = true,
    debug = false
}
----------------------------------------------------------------------
