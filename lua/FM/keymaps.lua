--------------------------------------------------------------------------------------------------
--local variables

---------------------------------------------
--For maping
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
---------------------------------------------

---------------------------------------------
--For Telescope
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
---------------------------------------------

---------------------------------------------
--For cmp
  local cmp = require'cmp'
  local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

  local luasnip = require("luasnip")
---------------------------------------------

---------------------------------------------
--For lsp-installer
local lsp_installer = require("nvim-lsp-installer")
---------------------------------------------

---------------------------------------------
--For trouble
local trouble = require("trouble")
---------------------------------------------

--------------------------------------------------------------------------------------------------

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

vim.cmd[[
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    tnoremap <Leader>ct <C-\><C-n>
]]
map('n', 'ot', ':terminal<CR>', opts) --open terminal
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
vim.g.floaterm_keymap_toggle = '<Leader>ft'
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
--Cod actions
map('n', '<Leader>cd', ':CodeActionMenu<Cr>', opts)
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--trouble
map("n", "<leader>sad", "<cmd>Trouble workspace_diagnostics<cr>", opts)
map("n", "<leader>sd", "<cmd>Trouble document_diagnostics<cr>", opts)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--Todo
map("n", "<Leader>td", "<cmd>TodoTrouble<CR>", opts)
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
--Telescope
telescope.setup {
  defaults = {

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        --["gg"] = actions.moveto_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  }
}
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--cmp
cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    },

  })
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--gitsigns
require('gitsigns').setup {
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
    ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
    ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
    ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
    ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },
}
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--lsp installer
lsp_installer.settings({

    ui = {
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install a server
            install_server = "i",
            -- Keymap to reinstall/update a server
            update_server = "u",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },
})
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--trouble
trouble.setup
{
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
}
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--onedark
require('onedark').setup  {
     -- toggle theme style ---
     toggle_style_key = '<leader>ts', -- Default keybinding to toggle
 }
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--vimspector
map('n', '<Leader>dc', ':cal vimspector#Continue()<cr>', opts)
map('n', '<Leader>sv', ':cal vimspector#StepOver()<cr>', opts)
map('n', '<Leader>sn', ':cal vimspector#StepInto()<cr>', opts)
map('n', '<Leader>su', ':cal vimspector#StepOut()<cr>', opts)
map('n', '<Leader>dr', ':VimspectorReset<cr>', opts)
map('n', '<Leader>db', ':cal vimspector#SetLineBreakpoint(file_name, line_num)', opts)
map('n', '<Leader>dbc', ':cal vimspector#ClearLineBreakpoint(file_name, line_num)', opts)
-----------------------------------------------------------------------------------------------
