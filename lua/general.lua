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
vim.opt.directory = '/home/aqashir/temp'
vim.g['backupdiri'] ='/home/aqashir/temp'
vim.opt.undodir = '/home/aqashir/temp'
--------------------------------------------------------------

vim.cmd[[
""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
"emojis
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')
"auto complite
set completefunc=emoji#complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! -nargs=0 Trim call Trim()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
]]
