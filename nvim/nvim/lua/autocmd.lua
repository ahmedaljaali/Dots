local autocmd = vim.api.nvim_create_autocmd


----------------------------------------------------------------------
--            Open .vert and .frag files as .glsl                   --

autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = { "*.vert", "*.frag"}, command = ":set filetype=glsl" }
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Automatically run :PackerCompile whenever             --
--                      plugins.lua is updated                      --

autocmd(
    {"BufWritePost"},
    { pattern = "plugins.lua", command = "source <afile> | PackerCompile" }
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Disable spellchecking for terminal window             --

autocmd(
    {"TermOpen"},
    { pattern = "term://*", command = "setlocal nospell" }
)
----------------------------------------------------------------------

----------------------------------------------------------------------
--   Disable tab line and go to the top  when startify is opened    --

-- WARN: tab line wont work after this autocmd
autocmd(
     { "FileType"},
    { pattern = "startify", command = "setlocal showtabline=0 | 3" }
)

-- WARN: temporary fix
autocmd(
     { "FileType"},
    { pattern = {"lua", "cpp"}, command = "set showtabline=2" }
)
----------------------------------------------------------------------

----------------------------------------------------------------------
--           Disable status line when alacritty is opened           --

-- WARN: status line wont work after this autocmd
autocmd(
     { "FileType"},
    { pattern = "startify", command = "setlocal laststatus=0" }
)

-- WARN: temporary fix
autocmd(
     { "FileType"},
    { pattern = {"lua", "cpp"}, command = "set laststatus=3" }
)
----------------------------------------------------------------------


----------------------------------------------------------------------
--            Disable spellchecking for cmake window                --

autocmd(
     { "FileType"},
    { pattern = "vimcmake", command = "setlocal nospell" }
)
----------------------------------------------------------------------
