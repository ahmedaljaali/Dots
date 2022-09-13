local utils = require('usr.utils')

-----------------------------
--make directory
utils.include('mkdir')
-----------------------------


-----------------------------
--stabilize
utils.include('stabilize').setup()
-----------------------------


-----------------------------
--registers

--An additional line with the registers without content.
vim.g.registers_show_empty_registers = 0

--Choose the border
vim.g.registers_window_border = 'rounded'
-----------------------------


----------------------------------------------------------------------
--                               Tidy                               --

utils.include('tidy').setup()
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Stay centered                           --

-- Exclude
vim.api.nvim_set_var('stay-centered#skip_filetypes', {'vimcmake', 'floaterm'})

utils.include('stay-centered')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Color picker                           --

utils.include('color-picker').setup({ -- for changing icons & mappings
	-- ['icons'] = { 'ﱢ', '' },
	-- ['icons'] = { 'ﮊ', '' },
	-- ['icons'] = { '', 'ﰕ' },
	-- ['icons'] = { '', '' },
	-- ['icons'] = { '', '' },
	['icons'] = { 'ﱢ', '' },
	['keymap'] = { -- mapping example:
		['U'] = '<Plug>Slider5Decrease',
		['O'] = '<Plug>Slider5Increase',
	},
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                      Use hop default config                      --

utils.include('hop').setup()
----------------------------------------------------------------------
