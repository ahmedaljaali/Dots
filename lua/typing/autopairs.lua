-----------------------------------------------------------------------------
--local variables
local npairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local ts_conds = require('nvim-autopairs.ts-conds')
npairs.add_rule(Rule("$$","$$","tex"))
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
npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  },
  -- disable for .vim files, but it work for another filetypes
  Rule("a","a","-vim")
)

npairs.add_rules({
  Rule("$$","$$","tex")
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
        -- don't add pair on that line
          return false
        end
    end)
   }
)

-- you can use regex
-- press u1234 => u1234number
npairs.add_rules({
    Rule("u%d%d%d%d$", "number", "lua")
      :use_regex(true)
})



-- press x1234 => x12341234
npairs.add_rules({
    Rule("x%d%d%d%d$", "number", "lua")
      :use_regex(true)
      :replace_endpair(function(opts)
          -- print(vim.inspect(opts))
          return opts.prev_char:sub(#opts.prev_char - 3,#opts.prev_char)
      end)
})


-- you can do anything with regex +special key
-- example press tab to uppercase text:
-- press b1234s<tab> => B1234S1234S

npairs.add_rules({
  Rule("b%d%d%d%d%w$", "", "vim")
    :use_regex(true,"<tab>")
    :replace_endpair(function(opts)
          return
              opts.prev_char:sub(#opts.prev_char - 4,#opts.prev_char)
              .."<esc>viwU"
    end)
})

-- you can exclude filetypes
npairs.add_rule(
  Rule("$$","$$")
    :with_pair(cond.not_filetypes({"lua"}))
)

-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
-----------------------------------------------------------------------------
