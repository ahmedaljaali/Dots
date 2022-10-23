local include= require('usr.utils').include
local lint = include('lint')


----------------------------------------------------------------------
--                               Glsl                               --

lint.linters_by_ft =
{
    glsl = {'glslc'},
}
----------------------------------------------------------------------
