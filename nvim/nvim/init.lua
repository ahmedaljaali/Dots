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


require('MF.startScreanConf')
require('MF.telescopeConf')
require('MF.fileStormConf')
require('MF.keymaps')
require('MF.statusLineConf')
require('MF.nvimTreeConf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Colors                              --


require('colors.themeConf')
require('colors.iconsConf')
require('colors.modesConf')
require('colors.hlargsConf')
require('colors.dressingConf')
require('colors.tablineConf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Typing                              --


require('typing.indentConf')
require('typing.spellingConf')
require('typing.autopairsConf')
require('typing.commentOutConf')
require('typing.lastplaceConf')
require('typing.autoSaveConf')
require('typing.todoConf')
require('typing.commentFrameConf')
require('typing.neoclipConf')
require('typing.dialConf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         Language Support                         --


require('LS.masonConf')
require('LS.luaDevConf')
require('LS.lsp-config')
require('LS.cmakeConf')
require('LS.treesitterConf')
require('LS.cmpConf')
require('LS.lspkindConf')
require('LS.codeActionsConf')
require('LS.troubleConf')
require('LS.symbolsOutlineConf')
require('LS.tabnineConf')
require('LS.fidgetConf')
require('LS.lspSignatureConf')
require('LS.treesitterContextConf')
require('LS.luasnipConf')
require('LS.dapConf')
require('LS.lintConf')
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Random stuff                           --

-- Short config
require('rand.shortConf')
require('rand.neovideConf')
----------------------------------------------------------------------
