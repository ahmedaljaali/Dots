-----------------------------------------------------------------------------
--local variables
local npairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local ts_conds = require('nvim-autopairs.ts-conds')
-----------------------------------------------------------------------------


-----------------------------------------------------------------------------
--Default values
local disable_filetype = { "TelescopePrompt" }
local disable_in_macro = false  -- disable when recording or executing a macro
local disable_in_visualblock = false -- disable when insert after visual block mode
local ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")
local enable_moveright = true
local enable_afterquote = true  -- add bracket pairs after quote
local enable_check_bracket_line = true  --- check bracket in same line
local check_ts = false
local map_bs = true  -- map the <BS> key
local map_c_h = false  -- Map the <C-h> key to delete a pair
local map_c_w = false -- map <c-w> to delete a pair if possible
-----------------------------------------------------------------------------



-----------------------------------------------------------------------------
--configs
npairs.setup({
  check_ts = true, --use treesitter
  enable_check_bracket_line = true, --Don't add pairs if it already has a close pair
  fast_wrap = {
    map = "<Leader>fw",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
})
-----------------------------------------------------------------------------


-----------------------------------------------------------------------------
--Auto pairs with nvim-cmp
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
-----------------------------------------------------------------------------


-----------------------------------------------------------------------------
--nvim-autopairs uses rules with conditions to check pairs
--- check ./lua/nvim-autopairs/rules/basic.lua
-----------------------------------------------------------------------------
