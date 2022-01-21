-----------------------------------------------------------
--Install them automatically
vim.g.vimspector_install_gadgets = { 'CodeLLDB' }
-----------------------------------------------------------

-----------------------------------------------------------
--Put this in you project dir and name the file .vimspector.json
--[[
{
  "configurations": {
    "Launch": {
      "adapter": "vscode-cpptools",
      "filetypes": [ "cpp", "c", "objc", "rust" ],
      "configuration": {
        "request": "launch",
        "program": "./Build/app",
        "args": [],
        "cwd": "${workspaceFolder}",
        "environment": [{ "name": "config", "value": "Debug" }],
        "externalConsole": true,
        "MIMode": "gdb"
      }
    }
  }
}
]]
--
