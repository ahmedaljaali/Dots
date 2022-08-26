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
project({} VERSION 1.0)

#--------------------------------------------------------------------#
#                          Get source files                          #


file(GLOB_RECURSE SOURCE_FILES ${{CMAKE_CURRENT_SOURCE_DIR}}/src/*.cc)
#--------------------------------------------------------------------#


add_executable(${{PROJECT_NAME}} ${{SOURCE_FILES}})


#--------------------------------------------------------------------#
#                        Include directories                         #


target_include_directories(${{PROJECT_NAME}} PUBLIC ${{CMAKE_CURRENT_SOURCE_DIR}}/inc)
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
    CXX_STANDARD_REQUIRED {}

    OUTPUT_NAME "{}"
)
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                            Use clang++                             #


set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_C_COMPILER clang)
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                               Debug                                #


SET(CMAKE_BUILD_TYPE debug)
SET(CMAKE_CXX_FLAGS_DEBUG "-g3 -O0 -Werror -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-padded")
#-Werror Treat warnings as errors
#--------------------------------------------------------------------#


#--------------------------------------------------------------------#
#                              Release                               #


# SET(CMAKE_BUILD_TYPE release)
SET(CMAKE_CXX_FLAGS_RELEASE "-O3")
#--------------------------------------------------------------------#
]],
    {
        i(1, 'Cmake Version'),
        i(2, 'Project Name'),
        i(3, 'C++ Version'),
        c(4, {t('ON'), t('OFF')}),
        i(5, 'Executable name')
    }
    )
)
table.insert(snippets, default)



local shaders = s('shaders',
    fmt(
[[

#--------------------------------------------------------------------#
#                        Compile shader code                         #


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
