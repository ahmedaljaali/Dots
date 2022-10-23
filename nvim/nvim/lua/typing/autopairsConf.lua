----------------------------------------------------------------------
--                         Local variables                          --


local include = require('usr.utils').include
local npairs = include('nvim-autopairs')
local cmp_autopairs = include('nvim-autopairs.completion.cmp')
local cmp = include('cmp')
local ts_conds = include('nvim-autopairs.ts-conds')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Default values                          --


local disable_filetype = { 'TelescopePrompt' }
local disable_in_macro = false  -- disable when recording or executing a macro
local disable_in_visualblock = false -- disable when insert after visual block mode
local ignored_next_char = string.gsub([[ [%w%%%'%[%'%.] ]],'%s+', '')
local enable_moveright = true
local enable_afterquote = true  -- add bracket pairs after quote
local enable_check_bracket_line = true  --- check bracket in same line
local check_ts = false
local map_bs = true  -- map the <BS> key
local map_c_h = false  -- Map the <C-h> key to delete a pair
local map_c_w = false -- map <c-w> to delete a pair if possible
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             Configs                              --


npairs.setup({
     -- Use treesitter
    check_ts = true,

     -- Don't add pairs if it already has a close pair
    enable_check_bracket_line = true,
    fast_wrap = {
        map = '<Leader>fw',
        chars = { '{', '[', '(', '"', '"' },
        pattern = string.gsub([[ [%'%'%)%>%]%)%}%,] ]], '%s+', ''),

     -- Offset from pattern match
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
    },
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                     Auto pairs with nvim-cmp                     --

-- If you want insert `(` after select function or method item

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--        nvim-autopairs uses rules with conditions to check        --
--                              pairs                               --


--- check ./lua/nvim-autopairs/rules/basic.lua
----------------------------------------------------------------------
