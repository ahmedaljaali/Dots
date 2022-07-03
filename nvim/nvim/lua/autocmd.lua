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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
----------------------------------------------------------------------


----------------------------------------------------------------------
--        Disable spellchecking when floaterm window is open        --

vim.cmd[[autocmd FileType floaterm setlocal nospell]]
----------------------------------------------------------------------
