require('plugins') --Put it in the top of the file, trust me you don't want to change it :}
require('general')

----------------------------------------------------------------------
--Language Support

require('language_support/cmake-config')
require('language_support/treesitter-config')
require('language_support/lsp-config')
require('language_support/cmp-config')
----------------------------------------------------------------------

----------------------------------------------------------------------
--Theme

require('themes/theme')
require('themes/rainbowBraket')
require('themes/lualine-conf')
require('themes/icons')
----------------------------------------------------------------------

----------------------------------------------------------------------
--Fast moving

require('FM/start-screan')
require('FM/fzfz')
require('FM/splitControl')
require('FM/fileStorm')
require('FM/fff')
require('FM/keymaps')
----------------------------------------------------------------------


----------------------------------------------------------------------
--typing

require('typing/indent')
require('typing/spelling')
require('typing/autopairs')
----------------------------------------------------------------------