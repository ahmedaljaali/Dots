local utils = require('usr.utils')
local lint = utils.include('lint')


----------------------------------------------------------------------
--                               Glsl                               --

lint.linters_by_ft =
{
    glsl = {'glslc'},
}
----------------------------------------------------------------------
