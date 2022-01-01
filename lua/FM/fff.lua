local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

map('n', '<c-t>', ':FloatermNew --autoclose=1  fff<cr>', opts)
