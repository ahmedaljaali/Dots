-----------------------------------------------------
--Open .vert and .frag file as .glsl files
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = { "*.vert", "*.frag"}, command = ":set filetype=glsl" }
)
-----------------------------------------------------
