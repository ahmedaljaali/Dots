-----------------------------
--make directory
require('mkdir')
-----------------------------


-----------------------------
--stabilize
require("stabilize").setup()
-----------------------------


-----------------------------
--registers

--An additional line with the registers without content.
vim.g.registers_show_empty_registers = 0

--Choose the border
vim.g.registers_window_border = "rounded"
-----------------------------


----------------------------------------------------------------------
--                               Tidy                               --

require("tidy").setup()
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Stay centered                           --

require("stay-centered")
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Color picker                           --

require("color-picker").setup({ -- for changing icons & mappings
	-- ["icons"] = { "ﱢ", "" },
	-- ["icons"] = { "ﮊ", "" },
	-- ["icons"] = { "", "ﰕ" },
	-- ["icons"] = { "", "" },
	-- ["icons"] = { "", "" },
	["icons"] = { "ﱢ", "" },
	["keymap"] = { -- mapping example:
		["U"] = "<Plug>Slider5Decrease",
		["O"] = "<Plug>Slider5Increase",
	},
})
----------------------------------------------------------------------
