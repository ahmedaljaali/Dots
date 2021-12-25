""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap  <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>af <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" working with tabs
nmap <Leader>cw :close<CR>
nmap <Leader>m :tabnew<CR>
nmap [t :tabprevious<CR>
nmap ]t :tabnext<CR>
nmap <Leader>b :Buffers <cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
"toggle between highlight search
nnoremap <C-]> :set hlsearch!<CR>
""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
"Working With sessions
nmap <Leader>cs :SClose<CR>
nmap <Leader>ls :SLoad<CR>
""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
"Close cmake window
nmap <Leader>cm :CMakeClose<CR>
""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
"Run the program
nmap <leader>tr :GTestRun<cr>
""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
"Cmake
nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""
