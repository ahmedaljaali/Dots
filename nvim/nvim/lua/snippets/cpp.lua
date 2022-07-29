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
local file_pattern = "*.cpp"
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Snippets                             --


local randomNum = s({trig = "random", name= "Random", dscr = "Generate a random number between min and max (inclusive)"},
    fmt(
[[
#include <random>

int getRandomNumber(int min, int max)
{{
    static std::mt19937 mt{{ std::random_device{{}}() }};

    std::uniform_int_distribution die{{ min, max }}; // we can create a distribution in any function that needs it

    return die(mt); // and then generate a random number from our global generator
}}
]],
    {

    })
)
table.insert(snippets, randomNum)



local timer= s({trig = "timer", name= "Timer", dscr = "Misure the time of execution"},
    fmt(
[[
#include <chrono> // for std::chrono functions

class Timer
{{
private:
    // Type aliases to make accessing nested type easier
    using clock_type = std::chrono::steady_clock;
    using second_type = std::chrono::duration<double, std::ratio<1> >;

    std::chrono::time_point<clock_type> m_beg {{ clock_type::now() }};

public:
    void reset()
    {{
        m_beg = clock_type::now();
    }}

    double elapsed() const
    {{
        return std::chrono::duration_cast<second_type>(clock_type::now() - m_beg).count();
    }}
}};
]],
    {

    })
)
table.insert(snippets, timer)



local class = s('clas',
    fmt(
[[
class {}
{{
private: // Private variables
    {}

public: // Public variables
    {}

private: // Private methods
    {}

public: // Public methods
    {}

}};
]],
    {
        i(1, "Class name"),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
    }
    )
)
table.insert(snippets, class)



local main = s("main",
    fmt(
[[
int main({})
{{
    {}


    return 0;
}}
]],
    {
        c(1, {t("int argc, char **argv"), t("void")}),
        i(2, "")

    }
    )
)
table.insert(snippets, main)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        Return snippets                         --

return snippets, autosnippets
----------------------------------------------------------------------
