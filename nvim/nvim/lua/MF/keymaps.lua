----------------------------------------------------------------------
--                         local variables                          --

local include = require('usr.utils').include

---------------------------------------------
-- For keymaps
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
---------------------------------------------

---------------------------------------------
-- Luasnip
local ls = include('luasnip')
---------------------------------------------

---------------------------------------------
-- Dap
local dap = include('dap')
---------------------------------------------

----------------------------------------------------------------------


----------------------------------------------------------------------
--                            lsp-config                            --


map('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<Leader>sh', '<CMD>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<Leader>rn', '<CMD>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<CMD>Telescope lsp_references<CR>', opts)
map('n', '<Leader>e', '<CMD>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<CMD>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<Leader>f', '<CMD>lua vim.lsp.buf.format{async = true}<CR>', opts)
map('n', '<Leader>sh', '<CMD>ClangdSwitchSourceHeader<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Resizing splits                          --

map('n', '<A-l>', '<CMD>vertical resize -3<CR>', opts)
map('n', '<A-h>', '<CMD>vertical resize +3<CR>', opts)
map('n', '<A-k>', '<CMD>resize -3<CR>', opts)
map('n', '<A-j>', '<CMD>resize +3<CR>', opts)
map('n', '<A-=>', '<C-w>=', opts)

map('t', '<A-l>', '<CMD>vertical resize -3<CR>', opts)
map('t', '<A-h>', '<CMD>vertical resize +3<CR>', opts)
map('t', '<A-k>', '<CMD>resize -3<CR>', opts)
map('t', '<A-j>', '<CMD>resize +3<CR>', opts)
map('t', '<A-=>', '<C-w>=', opts)

--Remap splits navigation to just CTRL + hjkl
map('n', '<C-h>', '<C-\\><C-N><C-w>h', opts)
map('n', '<C-j>', '<C-\\><C-N><C-w>j', opts)
map('n', '<C-k>', '<C-\\><C-N><C-w>k', opts)
map('n', '<C-l>', '<C-\\><C-N><C-w>l', opts)

map('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Debug                               --


map('n', '<Leader>dc', dap.continue, opts)
map('n', '<Leader>do', dap.step_over, opts)
map('n', '<Leader>di', dap.step_into, opts)
map('n', '<Leader>dt', dap.step_out, opts)

map('n', '<Leader>db', dap.toggle_breakpoint, opts)
map('n', '<leader>dB', function()
    dap.toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil, true)
end)

map('n', '<leader>dl', function()
    dap.toggle_breakpoint(nil, nil, vim.fn.input('Log point message: '), true)
end)
map('n', '<leader>drc', dap.run_to_cursor)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        working with tabs                         --


map('n', '<Leader>m', ':tabnew<CR>', opts)

map('n', ']t', '<CMD>tabnext<CR>', { silent = true })
map('n', '[t', '<CMD>tabprev<CR>', { silent = true })


map('n', '<Leader>ct', '<CMD>close<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                 toggle between highlight search                  --


map('n', '<C-]>', ':set hlsearch!<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                      Working With sessions                       --


map('n', '<Leader>cs', ':SClose<CR>', opts)
map('n', '<Leader>ls', ':SLoad<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Run C++ programs                         --

-- Close cmake then run
map('n', '<leader>tr', function()
    vim.cmd [[:CMakeClose]]
    vim.cmd [[:FloatermNew  --height=20 --autoclose=0  eval "$(find ./bin -type f -executable -print)"]]
end, opts)
----------------------------------------------------------------------


----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Cmake                               --


map('n', '<leader>cg', ':CMakeGenerate<CR>', opts)
map('n', '<leader>cb', ':CMakeBuild<CR>', opts)
map('n', '<Leader>cm', ':CMakeClose<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Ranger                              --


map('n', '<c-t>',
    ':FloatermNew --height=28 --width=124 --wintype=float --name=ranger --position=center --autoclose=2 ranger <CR>',
    opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            maximizer                             --


vim.g.maximizer_default_mapping_key = '<Leader>sm'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Code actions                            --


map('n', '<Leader>cd', ':CodeActionMenu<Cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Telescope                             --


map('n', '<leader>tf', '<CMD>Telescope find_files<CR>', opts)
map('n', '<leader>tg', '<CMD>Telescope live_grep<CR>', opts)
map('n', '<leader>tb', '<CMD>Telescope buffers<CR>', opts)
map('n', '<leader>th', '<CMD>Telescope help_tags<CR>', opts)

-- Telescope Luasnip
map('n', '<leader>tsp', '<CMD>Telescope luasnip<CR>', opts)

-- Neoclip
map('n', '<Leader>yh', '<CMD>Telescope neoclip<CR>', opts)

--Todo
map('n', '<Leader>td', '<CMD>TodoTelescope<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             trouble                              --


map('n', '<leader>tad', '<CMD>Trouble workspace_diagnostics<CR>', opts)
map('n', '<leader>tcd', '<CMD>Trouble document_diagnostics<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         symbols outline                          --


map('n', '<Leader>so', ':SymbolsOutlineOpen<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Undo tree                             --


map('n', '<Leader>ut', '<CMD>UndotreeToggle<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            nvimtree                             --


map('n', '<Leader>tt', '<CMD>NvimTreeToggle<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             luasnip                             --


map({ 'i', 's' }, '<Leader>sn', function() ls.jump(1) end, opts)
map({ 'i', 's' }, '<Leader>sp', function() ls.jump(-1) end, opts)
map({ 'i', 's' }, '<c-s>', '<Esc>:w<CR>')
map({ 'i', 's' }, '<c-u>', '<CMD>lua require(\'luasnip.extras.select_choice\')()<CR><C-c><C-c>')
map({ 'i', 's' }, '<a-p>', function()
    if ls.expand_or_jumpable() then
        ls.expand()
    end
end, { silent = true })
map({ 'i', 's' }, '<Leader>sc', function()
    if ls.choice_active() then
        ls.change_choice(1)
    else
        -- print current time
        local t = os.date('*t')
        local time = string.format('%02d:%02d:%02d', t.hour, t.min, t.sec)
        print(time)
    end
end)
map({ 'i', 's' }, '<Leader>sv', function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)
map('n', '<Leader>ls', '<CMD>source' .. vim.fn.stdpath('config') .. '/lua/LS/luasnip-conf.lua<CR>')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             Hexmode                              --


map('n', '<Leader>he', '<CMD>Hexmode<CR>', opts);
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               dial                               --

map('n', '<C-a>', require('dial.map').inc_normal(), opts)
map('n', '<C-x>', require('dial.map').dec_normal(), opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Tetris                              --

map('n', '<Leader>pt', '<CMD>Tetris<CR>', opts)

--[[
Conftrol
Left Arrow: move left
Right Arrow: move right
Up Arrow: rotate piece
Down Arrow: soft drop
Space Bar: hard drop
]]
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               Hop                                --

map('', 'fw', '<CMD>HopWord<CR>', opts)
map('', 'fp', '<CMD>HopPattern<CR>', opts)
map('', 'fc', '<CMD>HopChar2<CR>', opts)
map('', 'fl', '<CMD>HopLine<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            RGB picker                            --

map('n', '<Leader>rgb', '<CMD>PickColor<CR>', opts)
map('i', '<Leader>rgb', '<CMD>PickColorInsert<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Comment Frame                           --

map('n', '<leader>cc', require('nvim-comment-frame').add_comment, opts)

map('n', '<leader>C', require('nvim-comment-frame').add_multiline_comment, opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             floaterm                             --

vim.g.floaterm_keymap_new = '<Leader>fy'
vim.g.floaterm_keymap_toggle = '<Leader>ft'
vim.g.floaterm_keymap_next = '<Leader>fn'
vim.g.floaterm_keymap_prev = '<Leader>fp'
vim.g.floaterm_keymap_kill = '<Leader>fc'
----------------------------------------------------------------------

----------------------------------------------------------------------
--                           live server                            --

-- For web dev only!!!
map('n', '<leader>wls', function()
    vim.cmd [[:FloatermNew  --silent --height=5 --autoclose=0  live-server]]
end, opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Update                              --

map('n', '<leader>up', function()
    vim.cmd[[:PackerSync]]
    vim.cmd [[:MasonUpdate]]
    vim.cmd [[TSUpdate]]
end, opts)
----------------------------------------------------------------------

----------------------------------------------------------------------
--         Set the current working dir to the buffer parent         --
--                              folder                              --

-- map('n', '<Leader>cbd', function() vim.api.nvim_set_current_dir(tostring(vim.api.nvim_buf_get_name(0):match("(.+)%..+$")))end, opts)
map('n', '<Leader>cbd', function() vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))end, opts)
----------------------------------------------------------------------
