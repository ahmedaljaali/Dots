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
    cpp= {
        snip({

            trig = "random",
            namr = "Random number",
            dscr = "Renturn a random number between min and max range"
        },
        {
text({
    "#include <random>",
    "// Generate a random number between min and max (inclusive)",
    "// Assumes srand() has already been called",
    "int getRandomNumber(int min, int max)",
    "{",
        "static constexpr double fraction{ 1.0 / (static_cast<double>(RAND_MAX) + 1.0) };  // static used for efficiency, so we only calculate this value once",
        "// evenly distribute the random number across our range",
        "return static_cast<int>(std::rand() * fraction * (max - min + 1) + min);",
    "}"
})
    }),
        snip({

            trig = "timer",
            namr = "Timer",
            dscr = "Misure the time of execution"
        },
        {
text({
        "#include <chrono> // for std::chrono functions",
    "",
    "class Timer",
    "{",
    "private:",
        "// Type aliases to make accessing nested type easier",
        "using clock_type = std::chrono::steady_clock;",
        "using second_type = std::chrono::duration<double, std::ratio<1> >;",
    "",
        "std::chrono::time_point<clock_type> m_beg { clock_type::now() };",
    "",
    "public:",
        "void reset()",
        "{",
            "m_beg = clock_type::now();",
        "}",
    "",
        "double elapsed() const",
        "{",
            "return std::chrono::duration_cast<second_type>(clock_type::now() - m_beg).count();",
        "}",
    "};"
})
    }),
}})
