local augend = require("dial.augend")
local config = require("dial.config")


----------------------------------------------------------------------
--                            Setup Dial                            --

config.augends:register_group{
    -- default augends used when no group name is specified
    default = {

         -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.decimal,

        -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.integer.alias.hex,

        -- date (2022/02/19, etc.)
        augend.date.alias["%Y/%m/%d"],

        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.constant.new{
            elements = {"and", "or"},

            -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
            word = true,

            -- "or" is incremented into "and".
            cyclic = true,
        },

        augend.constant.new{
            elements = {"&&", "||"},
            word = false,
            cyclic = true,
        },

        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.hexcolor.new{
            case = "lower",
        },

        augend.user.new{
            find = require("dial.augend.common").find_pattern("%d+"),
            add = function(text, addend, cursor)
                local n = tonumber(text)
                n = math.floor(n * (2 ^ addend))
                text = tostring(n)
                cursor = #text
                return {text = text, cursor = cursor}
            end
        },

    },

    -- augends used when group with name `mygroup` is specified
    mygroup = {
        augend.integer.alias.decimal,

    -- boolean value (true <-> false)
        augend.constant.alias.bool,

    -- date (02/19/2022, etc.)
        augend.date.alias["%m/%d/%Y"],
    }
}
----------------------------------------------------------------------
