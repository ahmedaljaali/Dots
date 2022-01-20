local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
--------------------------------------------------------------------------------------------------
--lsp config

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<Leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<Leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--Remap splits navigation to just CTRL + hjkl
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--working with tabs
map('n', '<Leader>cw', ':close<CR>', opts)
map('n', '<Leader>m', ':tabnew<CR>', opts)
map('n', '[t', ':tabprevious<CR>', opts)
map('n', ']t', ':tabnext<CR>', opts)
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--toggle between highlight search
map('n', '<C-]>', ':set hlsearch!<CR>', opts)
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--Working With sessions
map('n', '<Leader>cs', ':SClose<CR>', opts)
map('n', '<Leader>ls', ':SLoad<CR>', opts)
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--Close cmake window
map('n', '<Leader>cm', ':CMakeClose<CR>', opts)
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
--Run the program
map('n', '<leader>tr', ':GTestRun<cr>', opts)
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
--Cmake
map('n', '<leader>cg', ':CMakeGenerate<cr>', opts)
map('n', '<leader>cb', ':CMakeBuild<cr>', opts)
--------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
--fff
map('n', '<c-t>', ':FloatermNew --autoclose=1  fff<cr>', opts)
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
--Telescope
map('n', '<leader>tf', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>tb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>th', '<cmd>Telescope help_tags<cr>', opts)
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
--maximizer
vim.g.maximizer_default_mapping_key = '<Leader>sm'
--------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--floaterm
vim.g.floaterm_keymap_new = '<Leader>fn'
vim.g.floaterm_keymap_prev   = '<leader>fp'
vim.g.floaterm_keymap_next   = '<leader>fx'
vim.g.floaterm_keymap_toggle = '<Leader>ft'
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
--Cod actions
map('n', '<Leader>cd', ':CodeActionMenu<Cr>', opts)
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--nvim-dap
vim.cmd([[

    nnoremap <silent> <Leader>dc :lua require'dap'.continue()<CR>
    nnoremap <silent> <Leader>sv :lua require'dap'.step_over()<CR>
    nnoremap <silent> <Leader>sn :lua require'dap'.step_into()<CR>
    nnoremap <silent> <Leader>su :lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <leader>ro :lua require'dap'.repl.open()<CR>
    nnoremap <silent> <leader>rl :lua require'dap'.run_last()<CR>
]])
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--trouble
map("n", "<leader>sad", "<cmd>Trouble workspace_diagnostics<cr>", opts)
map("n", "<leader>sd", "<cmd>Trouble document_diagnostics<cr>", opts)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
-----------------------------------------------------------------------------------------------
