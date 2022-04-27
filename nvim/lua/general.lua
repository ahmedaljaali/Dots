----------------------------------------------------------------------
--                   auto + smart indent for code                   --

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.g['t_Co'] = 256
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        => Mouse Scrolling                        --

vim.opt.mouse = 'a'
vim.opt.mouse = 'nicr'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                            Line warp                             --

vim.opt.wrap = true
----------------------------------------------------------------------


----------------------------------------------------------------------
--                        Postition in code                         --

vim.opt.number = true
vim.opt.ruler = true
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Tab related                            --

vim.opt.expandtab = true             --Use spaces instead of tabs.
vim.opt.smarttab = true              --Be smart using tabs ;)
vim.opt.shiftwidth = 4               --One tab == four spaces
vim.opt.tabstop = 4
----------------------------------------------------------------------


----------------------------------------------------------------------
--                         No warning sound                         --

vim.opt.errorbells = false
vim.opt.vb.t_vb = false
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Dont highlight search results by defuualt             --


vim.opt.hlsearch = false
----------------------------------------------------------------------


----------------------------------------------------------------------
--          Store backup, undo and swap files in temp dir           --

vim.opt.directory = os.getenv("HOME") .. '/temp/swap'
vim.g['backupdiri'] = os.getenv("HOME") .. '/temp/backup'
vim.opt.undodir = os.getenv("HOME") .. '/temp/undo'
----------------------------------------------------------------------