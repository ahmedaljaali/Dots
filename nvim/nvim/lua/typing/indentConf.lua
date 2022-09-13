local utils = require('usr.utils')
local indent_blankline = utils.include('indent_blankline')

----------------------------------------------------------------------
--                             Exclude                              --

vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_filetype_exclude = {
	'help',
	'startify',
	'dashboard',
	'packer',
	'neogitstatus',
	'NvimTree',
	'Trouble',
}
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        Edit Some settings                        --


vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = false
vim.g.indent_blankline_show_current_context = true


vim.cmd [[highlight IndentBlanklineIndent1 guifg=#98971a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#689d6a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#b16286 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#d65d0e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#458588 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#9d0006 gui=nocombine]]
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Setup indent                           --

indent_blankline.setup({
	show_current_context = true,
    char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
})
----------------------------------------------------------------------
