----------------------------------------------------------------------
--                         Local variables                          --


local utils = require('usr.utils')
local ls = utils.include('luasnip')
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = utils.include('luasnip.extras.fmt').fmt
local rep = utils.include('luasnip.extras').rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup('Lua Snippets', { clear = true })
local file_pattern = 'CMakeLists.txt'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Snippets                             --


local default = s('default',
    fmt(
[[
cmake_minimum_required(VERSION {})
project({} VERSION 1.0 LANGUAGES CXX)
include(ExternalProject)

#--------------------------------------------------------------------#
#                          Get source files                          #

file(GLOB_RECURSE SOURCE_FILES ${{CMAKE_CURRENT_SOURCE_DIR}}/src/*.cc)
#--------------------------------------------------------------------#

add_executable(${{PROJECT_NAME}} ${{SOURCE_FILES}})

#--------------------------------------------------------------------#
#                        Include directories                         #

target_include_directories(${{PROJECT_NAME}} PUBLIC
    ${{CMAKE_CURRENT_SOURCE_DIR}}/inc
)
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                           Set properties                           #

set_target_properties(${{PROJECT_NAME}} PROPERTIES
    # Specify directories
    ARCHIVE_OUTPUT_DIRECTORY "${{CMAKE_CURRENT_SOURCE_DIR}}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${{CMAKE_CURRENT_SOURCE_DIR}}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${{CMAKE_CURRENT_SOURCE_DIR}}/bin"

    # Set C++ slandered
    CXX_STANDARD {}
    CXX_STANDARD_REQUIRED ON

    OUTPUT_NAME ${{PROJECT_NAME}}
)
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                              Use mold                              #

if(NOT WIN32)
    target_link_options(${{PROJECT_NAME}} PUBLIC -fuse-ld=mold)
endif()
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                               Debug                                #

SET(CMAKE_BUILD_TYPE Debug)

# For memory
# SET(CMAKE_CXX_FLAGS_DEBUG "-gfull -ggdb3 -Wno-newline-eof -pedantic-errors -O0 -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-padded -Wno-documentation -Wno-documentation-unknown-command -fsanitize=memory -fno-omit-frame-pointer -fno-optimize-sibling-calls -fsanitize-memory-track-origins=2")

# For address
SET(CMAKE_CXX_FLAGS_DEBUG "-gfull -ggdb3 -Wno-newline-eof -pedantic-errors -O0 -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-padded -Wno-documentation -Wno-documentation-unknown-command -fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls")

#-Werror Treat warnings as errors
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                              Release                               #

# SET(CMAKE_BUILD_TYPE Release)
SET(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")
#--------------------------------------------------------------------#
]],
    {
        i(1, 'Cmake Version'),
        i(2, 'Project Name'),
        i(3, 'C++ Version'),
    }
    )
)
table.insert(snippets, default)



local shaders = s('shaders',
    fmt(
[[

#--------------------------------------------------------------------#
#                        Compile shader code                         #


find_package(Vulkan REQUIRED COMPONENTS glslc)
find_program(GLSLC_EXECUTABLE NAMES glslc HINTS Vulkan::glslc)

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
        COMMAND ${{GLSLC_EXECUTABLE}} -O ${{GLSL}} -o ${{SPIRV}}
        DEPENDS ${{GLSL}}
    )
    list(APPEND SPIRV_BINARY_FILES ${{SPIRV}})
endforeach(GLSL)

add_custom_target(
    Shaders
    DEPENDS ${{SPIRV_BINARY_FILES}}
)

add_dependencies(${{PROJECT_NAME}} Shaders)
#--------------------------------------------------------------------#
]]
    ,
    {

    }
    )
)
table.insert(snippets, shaders)

local updateSubmodule = s('updateSubmodule',
    fmt(
[[
#--------------------------------------------------------------------#
#                        Update git submodule                        #


find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${{CMAKE_CURRENT_SOURCE_DIR}}/.git")
    # Update if needed
    option(GIT_SUBMODULE "Check submodules during generation" ON)
    if(GIT_SUBMODULE)
        message(STATUS "Submodule Update")
        execute_process(COMMAND ${{GIT_EXECUTABLE}} submodule update --init --recursive --remote
            WORKING_DIRECTORY ${{CMAKE_CURRENT_SOURCE_DIR}}
            RESULT_VARIABLE GIT_SUBMOD_RESULT)

        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FETAL_ERROR submodule update field ${{GIT_SUBMOD_RESULT}})
        endif()
    endif()
endif()
#--------------------------------------------------------------------#
]],

    {

    }
    )
)
table.insert(snippets, updateSubmodule)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        Return snippets                         --

return snippets, autosnippets
----------------------------------------------------------------------
