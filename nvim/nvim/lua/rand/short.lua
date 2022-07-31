-----------------------------
--make directory
require("usr.utils").import('mkdir')
-----------------------------


-----------------------------
--stabilize
require("usr.utils").import("stabilize").setup()
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

require("usr.utils").import("tidy").setup()
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Stay centered                           --

require("usr.utils").import("stay-centered")

-- Exclude
vim.api.nvim_set_var('stay-centered#skip_filetypes', {"vimcmake", "floaterm"})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Color picker                           --

require("usr.utils").import("color-picker").setup({ -- for changing icons & mappings
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


----------------------------------------------------------------------
--                      Use hop default config                      --

require("usr.utils").import('hop').setup()
----------------------------------------------------------------------
