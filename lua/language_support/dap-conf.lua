local dap = require('dap')
dap.adapters.cpp = {
   type = 'executable',
   attach = {
      pidProperty = "pid",
      pidSelect = "ask"
   },
   command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
   env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = true,
      externalTerminal = true
   },
   name = "lldb"
}

dap.configurations.cpp = {
    {
       name = "lldb",
       type = "cpp",
       request = "launch",
       program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
       end,
       cwd = '${workspaceFolder}',
       externalTerminal = true,
       stopOnEntry = true,
       args = {}
    },
}
