local utils = require('usr.utils')
local webdev = utils.include('nvim-web-devicons')


----------------------------------------------------------------------
--                        Icons to override                         --

local my_icons = {
    cc= {
        icon = '',
        color = '#458588',
        name = 'cc'
    }
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--          Check weather webdev constructor has been cold          --

if webdev.has_loaded then
  webdev.set_icon (my_icons)
else
  webdev.setup({ override = my_icons, default = true })
end
----------------------------------------------------------------------
