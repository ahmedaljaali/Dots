-------------------------------------------------------------
-- auto + smart indent for code
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.g['t_Co'] = 256
-------------------------------------------------------------

-------------------------------------------------------------
-- => Mouse Scrolling
vim.opt.mouse = 'a'
vim.opt.mouse = 'nicr'
-------------------------------------------------------------

-------------------------------------------------------------
--Line wrap
vim.opt.wrap = true
-------------------------------------------------------------

-------------------------------------------------------------
--Position in code
vim.opt.number = true
vim.opt.ruler = true
--------------------------------------------------------------




--------------------------------------------------------------
-- => Text, tab and indent related
vim.opt.expandtab = true             --Use spaces instead of tabs.
vim.opt.smarttab = true              --Be smart using tabs ;)
vim.opt.shiftwidth = 4               --One tab == four spaces
vim.opt.tabstop = 4
--------------------------------------------------------------


--------------------------------------------------------------
--No warning sound
vim.opt.errorbells = false
vim.opt.vb.t_vb = false
--------------------------------------------------------------


--------------------------------------------------------------
--no high light by defualt
vim.opt.hlsearch = false
--------------------------------------------------------------

--------------------------------------------------------------
--store backup, undo, and swap files in temp directory
vim.opt.directory = os.getenv("HOME") .. '/temp/swap'
vim.g['backupdiri'] = os.getenv("HOME") .. '/temp/backup'
vim.opt.undodir = os.getenv("HOME") .. '/temp/undo'
--------------------------------------------------------------
