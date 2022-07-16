----------------------------------------------------------------------
--            Open .vert and .frag files as .glsl                   --

vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = { "*.vert", "*.frag"}, command = ":set filetype=glsl" }
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Automatically run :PackerCompile whenever             --
--                      plugins.lua is updated                      --

vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    { pattern = "plugins.lua", command = "source <afile> | PackerCompile" }
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Disable spellchecking for terminal window             --

vim.api.nvim_create_autocmd(
    {"TermOpen"},
    { pattern = "term://*", command = "setlocal nospell" }
)
----------------------------------------------------------------------

----------------------------------------------------------------------
--             Disable tab line when startify is opened             --

-- WARN: tab line wont work after this autocmd
vim.api.nvim_create_autocmd(
     { "FileType"},
    { pattern = "startify", command = "setlocal showtabline=0" }
)

-- WARN: temporary fix
vim.api.nvim_create_autocmd(
     { "FileType"},
    { pattern = {"lua", "cpp"}, command = "set showtabline=2" }
)
----------------------------------------------------------------------

----------------------------------------------------------------------
--           Disable status line when alacritty is opened           --

-- WARN: status line wont work after this autocmd
vim.api.nvim_create_autocmd(
     { "FileType"},
    { pattern = "startify", command = "setlocal laststatus=0" }
)

-- WARN: temporary fix
vim.api.nvim_create_autocmd(
     { "FileType"},
    { pattern = {"lua", "cpp"}, command = "set laststatus=2" }
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Disable spellchecking for cmake window                --

vim.api.nvim_create_autocmd(
     { "FileType"},
    { pattern = "vimcmake", command = "setlocal nospell" }
)
----------------------------------------------------------------------
