----------------------------
--focus
require("focus").setup({
    enable = true,
    width = 80, --dont make it higher than this
})
-----------------------------

-----------------------------
--make directory
require('mkdir')
-----------------------------

-----------------------------
--toggleterm
require("toggleterm").setup
{
      shade_terminals = false,
      direction = 'tab',
}
-----------------------------

-----------------------------
--stabilize
require("stabilize").setup()
-----------------------------

-----------------------------
--friendly-snippets
require("luasnip/loaders/from_vscode").load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" }})
-----------------------------

-----------------------------
--registers

--An additional line with the registers without content.
vim.g.registers_show_empty_registers = 0

--Choose the border
vim.g.registers_window_border = "rounded"
-----------------------------
