local utils = require('usr.utils')
local spellchecking = utils.include('spellsitter')

----------------------------------------------------------------------
--                           Spellsitter                            --

spellchecking.setup {
    -- Whether enabled, can be a list of file types, e.g. {'python', 'lua'}
    enable = true,
    debug = false
}
----------------------------------------------------------------------
