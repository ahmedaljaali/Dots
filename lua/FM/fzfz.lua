local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

map('n', '<C-p>', ':Files<Cr>', opts)

vim.cmd[[let g:fzf_layout = { 'down': '40%' }]]
