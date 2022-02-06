local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = {
  "cpp",
  "vim",
  "cmake",
  "markdown",
  "lua",
},
sync_install = true;
highlight = { -- enable highlighting
  enable = true,
},
indent = {
  enable = false, -- default is disabled anyways
}
}
