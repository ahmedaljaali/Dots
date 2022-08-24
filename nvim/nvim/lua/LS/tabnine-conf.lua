

    --NOTE: Eats a lot of memory!
--[[ 
local utils = require('usr.utils')
local tabnine = utils.include('cmp_tabnine.config')

----------------------------------------------------------------------
--                          Setup tabnine                           --

tabnine:setup({
    disable = true,
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
    ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	};
})
---------------------------------------------------------------------- ]]
