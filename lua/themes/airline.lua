------------------------------------------------------
--enable tabline
vim.g['airline#extensions#tabline#enabled'] = true
vim.g['airline#extensions#tabline#left_sep'] = ''
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
vim.g['airline#extensions#tabline#right_sep'] = ''
vim.g['airline#extensions#tabline#right_alt_sep'] = ''
------------------------------------------------------

------------------------------------------------------
--enable powerline fonts
vim.g.airline_powerline_fonts = true
vim.g.airline_left_sep = ''
vim.g.airline_right_sep = ''
------------------------------------------------------

------------------------------------------------------
--Switch to your current theme
vim.cmd([[ let g:airline_theme = 'onedark' ]])
------------------------------------------------------

------------------------------------------------------
--Always show tabs
vim.opt.showtabline = 2
------------------------------------------------------

------------------------------------------------------
--We don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false
------------------------------------------------------
