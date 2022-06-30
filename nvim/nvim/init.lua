require('plugins') --Put it in the top of the file, Don't change it!!!
require('general') -- general configurations
require("autocmd") --Auto commands


----------------------------------------------------------------------
--                           Moving fast                            --


require('MF.start-screan')
require('MF.telescope-conf')
require('MF.fileStorm')
require('MF.keymaps')
require('MF.status-line')
require('MF.nvim-tree-conf')
require('MF.hop-conf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Colors                              --


require('colors.theme')
require('colors.rainbowBraket')
require('colors.icons')
require('colors.modes-conf')
require('colors.hlargs-conf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Typing                              --


require('typing.indent')
require('typing.spelling')
require('typing.autopairs')
require('typing.comment-out')
require('typing.beacon')
require('typing.lastplace')
require('typing.auto-save')
require('typing.todo-conf')
require('typing.comment-frame')
require('typing.neoclip-conf')
require('typing.dial-conf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Language support                         --


require('language_support.cmake-config')
require('language_support.treesitter-config')
require('language_support.lsp-installer')
require('language_support.cmp-config')
require('language_support.gitsigns-conf')
require('language_support.lspkind-conf')
require('language_support.lsp-config')
require('language_support.code-actions')
require('language_support.nvim-lua')
require('language_support.trouble-conf')
require('language_support.symbols-outline-conf')
require('language_support.tabnine-conf')
require('language_support.fidget-conf')
require('language_support.lsp-signature-conf')
require('language_support.treesitter-context-conf')
require('language_support.renamer-conf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             snippets                             --


require("snippets.cpp")
require("snippets.cmake")
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Random stuff                           --


require("rand.short")  --Short config
----------------------------------------------------------------------
