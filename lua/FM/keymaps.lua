local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
--------------------------------------------------------------------------------------------------
--lsp config

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
map('n', '<Leader>b',':Buffers<CR>', opts)
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
--fzfz
map('n', '<C-p>', ':Files<Cr>', opts)
--------------------------------------------------------------------------------------------------
