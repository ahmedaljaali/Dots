 --Put it in the top of the file, Don't change it!!!
require('usr.plugins')

 --general configurations
require('usr.general')

 --Auto commands
require('usr.autocmd')


----------------------------------------------------------------------
--                        Make neovim faster                        --


require('usr.utils').include('impatient')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Moving Fast                            --


require('MF.startScrean')
require('MF.telescope')
require('MF.fileStorm')
require('MF.keymaps')
require('MF.statusLine')
require('MF.nvimTree')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Colors                              --


require('colors.theme')
require('colors.icons')
require('colors.modes')
require('colors.hlargs')
require('colors.dressing')
require('colors.tabline')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Typing                              --


require('typing.indent')
require('typing.spelling')
require('typing.autopairs')
require('typing.commentOut')
require('typing.lastplace')
require('typing.autoSave')
require('typing.todo')
require('typing.commentFrame')
require('typing.neoclip')
require('typing.dial')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Language Support                         --


require('LS.mason')
require('LS.luaDev')
require('LS.lsp-config')
require('LS.cmake')
require('LS.treesitter')
require('LS.cmp')
require('LS.lspkind')
require('LS.codeActions')
require('LS.trouble')
require('LS.symbolsOutline')
require('LS.tabnine')
require('LS.fidget')
require('LS.lspSignature')
require('LS.treesitterContext')
require('LS.luasnip')
require('LS.dap')
require('LS.lint')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Random stuff                           --

-- Short config
require('rand.short')
require('rand.neovide')
----------------------------------------------------------------------
