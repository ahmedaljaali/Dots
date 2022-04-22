-----------------------------------------------------
--Open .vert and .frag file as .glsl files
vim.cmd([[autocmd BufNewFile,BufRead  *.frag set filetype=glsl]])
vim.cmd([[autocmd BufNewFile,BufRead  *.vert set filetype=glsl]])
-----------------------------------------------------
