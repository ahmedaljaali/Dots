vim.g.floaterm_position = 'bottom'
vim.g.floaterm_opener = 'tabe'
vim.g.floaterm_autoclose = 2
vim.g.floaterm_autohide = 2
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.4
vim.g.floaterm_wintype = 'split'


-----------------------------------------------------------------------------------------------
--For debugging
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "gdb Build/app",
  direction = "tab",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})

function _gdb_toggle()
  lazygit:toggle()
end
-----------------------------------------------------------------------------------------------
