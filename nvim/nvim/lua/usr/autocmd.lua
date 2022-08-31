local autocmd = vim.api.nvim_create_autocmd


----------------------------------------------------------------------
--            Open .vert and .frag files as .glsl                   --

autocmd(
    {'BufNewFile', 'BufRead'},
    {pattern = { '*.vert', '*.frag'}, command = ':set filetype=glsl'}
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Automatically run :PackerCompile whenever             --
--                      plugins.lua is updated                      --

autocmd(
    {'BufWritePost'},
    {pattern = 'plugins.lua', command = 'source <afile> | PackerCompile'}
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Disable spellchecking for terminal window             --

autocmd(
    {'TermOpen'},
    {pattern = 'term://*', command = 'setlocal nospell'}
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--          Disable tab line and go to the top of the file          --
--                     when Startify is opened                      --

-- WARN: Tab line wont work after this autocmd
autocmd(
    {'User'},
    {pattern = 'StartifyReady', command = 'setlocal showtabline=0 | 3'}
)

-- WARN: Temporary fix
autocmd(
    {'User', 'SessionLoadPost'},
    {pattern = 'StartifyBufferOpened', command = 'set showtabline=2'}
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--           Disable status line when Startify is opened           --

-- WARN: Status line wont work after this autocmd
autocmd(
    {'User'},
    {pattern = 'StartifyReady' , command ='setlocal laststatus=0'}
)

-- WARN: Temporary fix
autocmd(
    {'User', 'SessionLoadPost'},
    {pattern = 'StartifyBufferOpened', command = 'set laststatus=3'}
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Disable spellchecking for cmake window                --

autocmd(
    {'FileType'},
    {pattern = 'vimcmake', command = 'setlocal nospell'}
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--                             Luasnip                              --

vim.cmd([[command! LuaSnipEdit :lua require('luasnip.loaders.from_lua').edit_snippet_files()]]) --}}}
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          For nvim lint                           --


autocmd(
    { 'BufWritePost' },
    {
        callback = function()
            require('lint').try_lint()
        end,
    }
)
----------------------------------------------------------------------
