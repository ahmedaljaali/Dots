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
}})
