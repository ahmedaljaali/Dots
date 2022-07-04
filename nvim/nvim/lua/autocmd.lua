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
--        Disable spellchecking when terminal window is open        --

vim.api.nvim_create_autocmd(
    {"TermOpen"},
    { pattern = "term://*", command = "setlocal nospell" }
)
----------------------------------------------------------------------
