local ls = require("usr.utils").import("luasnip")

-- some shortcuts
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
    "int getRandomNumber(int min, int max)",
    "{",
    "    static std::mt19937 mt{ std::random_device{}() };",
    "",
    "    std::uniform_int_distribution die{ min, max }; // we can create a distribution in any function that needs it",
    "",
"    return die(mt); // and then generate a random number from our global generator",
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

        snip({

            trig = "clas",
            namr = "class",
            dscr = "Basic class"
        },
        {
    text({"class "}), insert(1, "Name"),
    text({
    "",
    "{",
    "private: // Private variables",
    ""}),
    insert(2),
    text({
    "",
    "",
    "public: // Public variables",
    "",
    "",
    "",
    "private: // Private methods",
    "",
    "",
    "",
    "public: // Public methods",
    "",
    "",
    "",
    "};"
})
    }),
}})
