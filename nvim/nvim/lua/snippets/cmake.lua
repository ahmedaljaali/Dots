----------------------------------------------------------------------
--                         Local variables                          --

local ls = require("usr.utils").import("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require('usr.utils').import("luasnip.extras.fmt").fmt
local rep = require('usr.utils').import("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "CMakeLists.txt"
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Snippets                             --


local default = s('default',
    fmt(
[[
cmake_minimum_required(VERSION {})
project({} VERSION 1.0)

# Set C++ slandered
set(CMAKE_CXX_STANDARD {})
set(CMAKE_CXX_STANDARD_REQUIRED {})

# Get source files
file(GLOB_RECURSE SOURCE_FILES ${{CMAKE_CURRENT_SOURCE_DIR}}/src/*.cc)

add_executable(${{PROJECT_NAME}} ${{SOURCE_FILES}})

# Include directory
target_include_directories(${{PROJECT_NAME}} PUBLIC ${{CMAKE_CURRENT_SOURCE_DIR}}/inc)

# Change properties
set_target_properties( ${{PROJECT_NAME}}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${{CMAKE_CURRENT_SOURCE_DIR}}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${{CMAKE_CURRENT_SOURCE_DIR}}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${{CMAKE_CURRENT_SOURCE_DIR}}/bin"
    OUTPUT_NAME {}
)

#Debug
target_compile_options(${{PROJECT_NAME}} PUBLIC   -Werror -ggdb -O0 -Wall -Wextra  -Wextra -Weffc++  -Wsign-conversion -pedantic-errors)

#Release
# target_compile_options(${{PROJECT_NAME}} PUBLIC   -Werror  -O3 -Wall -Wextra  -Wextra -Weffc++  -Wsign-conversion -pedantic-errors)
#-Werror add this option if you want to treat warnings as errors

]],
    {
        i(1, "Cmake Version"),
        i(2, "Project Name"),
        i(3, "C++ Version"),
        c(4, {t("ON"), t("OFF")}),
        i(5, "Executable name")
    }
    )
)
table.insert(snippets, default)



local shaders = s("shaders",
    fmt(
[[
#Compile Shaders Code
find_program(GLSL_VALIDATOR glslangValidator HINTS
  ${{Vulkan_GLSLANG_VALIDATOR_EXECUTABLE}}
  /usr/bin
  /usr/local/bin
  ${{VULKAN_SDK_PATH}}/Bin
  ${{VULKAN_SDK_PATH}}/Bin32
  $ENV{{VULKAN_SDK}}/Bin/
  $ENV{{VULKAN_SDK}}/Bin32/

)
# get all .vert and .frag files in shaders directory
file(GLOB_RECURSE GLSL_SOURCE_FILES
"${{PROJECT_SOURCE_DIR}}/shaders/*.frag"
"${{PROJECT_SOURCE_DIR}}/shaders/*.vert"
)
foreach(GLSL ${{GLSL_SOURCE_FILES}})
  get_filename_component(FILE_NAME ${{GLSL}} NAME)
  set(SPIRV "${{PROJECT_SOURCE_DIR}}/shaders/${{FILE_NAME}}.spv")
  add_custom_command(
    OUTPUT ${{SPIRV}}
    COMMAND ${{GLSL_VALIDATOR}} -V ${{GLSL}} -o ${{SPIRV}}
    DEPENDS ${{GLSL}})
  list(APPEND SPIRV_BINARY_FILES ${{SPIRV}})
endforeach(GLSL)

add_custom_target(
    Shaders
    DEPENDS ${{SPIRV_BINARY_FILES}}
)
add_dependencies(${{PROJECT_NAME}} Shaders)
]]
    ,
    {

    }
    )
)
table.insert(snippets, shaders)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        Return snippets                         --

return snippets, autosnippets
----------------------------------------------------------------------
