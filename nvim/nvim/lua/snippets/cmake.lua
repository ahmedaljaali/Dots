local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


ls.add_snippets(nil, {
    cmake= {
        snip({

            trig = "default",
            namr = "default",
            dscr = "default cmakelist"
        },
        {
    text({
    "cmake_minimum_required(VERSION "}), insert(1, "cmake version"),
    text({")", "project("}),insert(2, "project name"),
    text({" VERSION 1.0)", "set(CMAKE_CXX_STANDARD "}), insert(3, "cpp version"),
    text({" )",
    "set(CMAKE_CXX_STANDARD_REQUIRED ON)",
    "file(GLOB_RECURSE SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc)",
    "add_executable(${PROJECT_NAME} ${SOURCE_FILES})",
    "set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "}),
    insert(4, "output name"), text({")",

    "target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc)",
    "#Debug",
    "target_compile_options(${PROJECT_NAME} PUBLIC   -Werror -ggdb -O0 -Wall -Wextra  -Wextra -Weffc++  -Wsign-conversion -pedantic-errors)",
    "",
    "#Release",
    "# target_compile_options(${PROJECT_NAME} PUBLIC   -Werror  -O3 -Wall -Wextra  -Wextra -Weffc++  -Wsign-conversion -pedantic-errors)",
    "#-Werror add this option if you want to treat warnings as errors"
  })
    }),
        snip({

            trig = "shaders",
            namr = "Shaders",
            dscr = "Build SHADERS"
        },
        {
        text({"find_program(GLSL_VALIDATOR glslangValidator HINTS",
        "  ${Vulkan_GLSLANG_VALIDATOR_EXECUTABLE}",
        "  /usr/bin",
        "  /usr/local/bin",
        "  ${VULKAN_SDK_PATH}/Bin",
        "  ${VULKAN_SDK_PATH}/Bin32",
        "  $ENV{VULKAN_SDK}/Bin/",
        "  $ENV{VULKAN_SDK}/Bin32/",
        "",
        ")",
        "# get all .vert and .frag files in shaders directory",
        "file(GLOB_RECURSE GLSL_SOURCE_FILES",
        '\"${PROJECT_SOURCE_DIR}/shaders/*.frag\"',
        '\"${PROJECT_SOURCE_DIR}/shaders/*.vert\"',
        ")",
        "foreach(GLSL ${GLSL_SOURCE_FILES})",
        "  get_filename_component(FILE_NAME ${GLSL} NAME)",
        '  set(SPIRV \"${PROJECT_SOURCE_DIR}/shaders/${FILE_NAME}.spv\")',
        "  add_custom_command(",
        "    OUTPUT ${SPIRV}",
        "    COMMAND ${GLSL_VALIDATOR} -V ${GLSL} -o ${SPIRV}",
        "    DEPENDS ${GLSL})",
        "  list(APPEND SPIRV_BINARY_FILES ${SPIRV})",
        "endforeach(GLSL)",
        "",
        "add_custom_target(",
        "    Shaders",
        "    DEPENDS ${SPIRV_BINARY_FILES}",
        ")",
        "add_dependencies(${PROJECT_NAME} Shaders)"
        })
    })
}})
