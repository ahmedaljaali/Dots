----------------------------------------------------------------------
--                         local variables                          --

---------------------------------------------
--For keymaps
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
---------------------------------------------

---------------------------------------------
-- Luasnip
local ls = require("usr.utils").import("luasnip")
---------------------------------------------

----------------------------------------------------------------------


----------------------------------------------------------------------
--                            lsp config                            --


map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<Leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<Leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>" , opts)
map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
map('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Resizing splits                          --

map('', '<A-l>', '<cmd>vertical resize -3<CR>', opts)
map('', '<A-h>', '<cmd>vertical resize +3<CR>', opts)
map('', '<A-k>', '<cmd>resize -3<CR>', opts)
map('', '<A-j>', '<cmd>resize +3<CR>', opts)
map('', '<A-=>', '<C-w>=', opts)


--Remap splits navigation to just CTRL + hjkl
map("", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
map("", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
map("", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
map("", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              debug                               --


map('n', '<Leader>db', "<cmd>FloatermNew gdb  eval \"$(find ./bin -type f -executable -print)\" <CR>", opts)

----------------------------------------------------------------------


----------------------------------------------------------------------
--                        working with tabs                         --


map('n', '<Leader>m', ':tabnew<CR>', opts)

map('n', ']t', '<cmd>tabnext<CR>',  { silent = true })
map('n', '[t', '<cmd>tabprev<CR>',  { silent = true })


map('n', '<Leader>ct', '<cmd>close<CR>', opts)

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

-- close cmake then run
map('n', '<leader>tr', function ()
    vim.cmd[[:CMakeClose]]
    vim.cmd[[:FloatermNew  --height=20 --autoclose=0  eval "$(find ./bin -type f -executable -print)"]]
end, opts)
----------------------------------------------------------------------


----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Cmake                               --


map('n', '<leader>cg', ':CMakeGenerate<cr>', opts)
map('n', '<leader>cb', ':CMakeBuild<cr>', opts)
map('n', '<Leader>cm', ':CMakeClose<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Ranger                              --


map('n', '<c-t>', ':FloatermNew --height=28 --width=124 --wintype=float --name=ranger --position=center --autoclose=2 ranger <cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            maximizer                             --


vim.g.maximizer_default_mapping_key = '<Leader>sm'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Cod actions                            --


map('n', '<Leader>cd', ':CodeActionMenu<Cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Telescope                             --


map('n', '<leader>tf', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>tb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>th', '<cmd>Telescope help_tags<cr>', opts)

-- Telescope Luasnip
map("n", "<leader>tsp", "<cmd>Telescope luasnip<cr>", opts)

-- Neoclip
map("n", "<Leader>yh", "<cmd>Telescope neoclip<cr>", opts)

--Todo
map("n", "<Leader>td", "<cmd>TodoTelescope<CR>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             trouble                              --


map("n", "<leader>tad", "<cmd>Trouble workspace_diagnostics<cr>", opts)
map("n", "<leader>tcd", "<cmd>Trouble document_diagnostics<cr>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         symbols outline                          --


map('n', '<Leader>su', ':SymbolsOutlineOpen<CR>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Undo tree                             --


map('n', '<Leader>ut', '<cmd>UndotreeToggle<cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            nvimtree                             --


map('n', '<Leader>tt', '<cmd>NvimTreeToggle<cr>', opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             luasnip                             --


map({ "i", "s" }, "<Leader>sn", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
map({ "i", "s" }, "<Leader>sp", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
map({ "i", "s" }, "<c-s>", "<Esc>:w<cr>")
map({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
map({ "i", "s" }, "<a-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end, { silent = true })
map({ "i", "s" }, "<Leader>sc", function()
	if ls.choice_active() then
		ls.change_choice(1)
	else
		-- print current time
		local t = os.date("*t")
		local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
		print(time)
	end
end)
map({ "i", "s" }, "<Leader>sv", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)
map('n', '<Leader>ls', '<cmd>source' .. vim.fn.stdpath('config') .. '/lua/LS/luasnip-conf.lua<CR>')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             Hexmode                              --


map('n', '<Leader>he', "<cmd>Hexmode<cr>", opts);
----------------------------------------------------------------------


----------------------------------------------------------------------
--                               dial                               --

map("n", "<C-a>", require("dial.map").inc_normal(), opts)
map("n", "<C-x>", require("dial.map").dec_normal(), opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Tetris                              --

map('n', '<Leader>pt', "<cmd>Tetris<cr>", opts)

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

map("", "fw", "<cmd>HopWord<CR>", opts)
map("", "fp", "<cmd>HopPattern<CR>", opts)
map("", "fc", "<cmd>HopChar2<CR>", opts)
map("", "fl", "<cmd>HopLine<CR>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            RGB picker                            --

map("n", "<Leader>rgb", "<cmd>PickColor<cr>", opts)
map("i", "<Leader>rgb", "<cmd>PickColorInsert<cr>", opts)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Comment Frame                           --

vim.api.nvim_set_keymap('n', '<leader>cc', ":lua require('nvim-comment-frame').add_comment()<CR>", {})

vim.api.nvim_set_keymap('n', '<leader>C', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", {})
----------------------------------------------------------------------
