require('plugins') --Put it in the top of the file, trust me you don't want to change it :}
require('general')

----------------------------------------------------------------------
--Fast moving

require('FM/start-screan')
require('FM/telescope-conf')
require('FM/fileStorm')
require('FM/keymaps')
require('FM/status-line')
require('FM/ranger')
require('FM/barbar')
require('FM/smart-splits-conf')
require('FM/nvim-tree-conf')
----------------------------------------------------------------------

----------------------------------------------------------------------
--colors

require('colors/theme')
require('colors/rainbowBraket')
require('colors/icons')
require('colors/modes-conf')
----------------------------------------------------------------------

----------------------------------------------------------------------
--typing

require('typing/indent')
require('typing/spelling')
require('typing/autopairs')
require('typing/comment-out')
require('typing/beacon')
require('typing/lastplace')
require('typing/auto-save')
require('typing/todo-conf')
----------------------------------------------------------------------

----------------------------------------------------------------------
--Language Support

require('language_support/cmake-config')
require('language_support/treesitter-config')
require('language_support/lsp-installer')
require('language_support/cmp-config')
require('language_support/gitsigns-conf')
require('language_support/lspkind-conf')
require('language_support/lsp-config')
require('language_support/code-actions')
require('language_support/nvim-lua')
require('language_support/trouble-conf')
require('language_support/symbols-outline-conf')
require('language_support/tabnine-conf')
require('language_support/fidget-conf')
require('language_support/hlargs-conf')
require('language_support/lsp-signature-conf')
require('language_support/treesitter-context-conf')
----------------------------------------------------------------------
