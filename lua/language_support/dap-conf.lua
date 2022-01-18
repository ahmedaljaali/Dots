local dap = require('dap')

-------------------------------------------------------------------
--adapter configuration
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode', -- adjust as needed
  name = "lldb"
}
-------------------------------------------------------------------

-------------------------------------------------------------------
--cpp configurations
dap.configurations.cpp = {
  {
  env = function()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
      table.insert(variables, string.format("%s=%s", k, v))
    end
    return variables
  end,
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false, --IDK why but if you enable it your code will show as assembly
    args = {},

    runInTerminal = false, --Trust me, you don't want to enable it!!
  },
}
-------------------------------------------------------------------


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
-------------------------------------------------------------------


-------------------------------------------------------------------
-- use this settings for rust and c
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
-------------------------------------------------------------------
