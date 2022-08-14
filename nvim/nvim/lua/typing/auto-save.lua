local autosave = require("usr.utils").import("autosave")

----------------------------------------------------------------------
--                      Cursor Hold Update time                  --

vim.opt.updatetime = 1000
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          setup autoSave                          --


autosave.setup(
    {
        enabled = true,
        execution_message = "Saved at " .. os.date("%H:%M:%S"),
        events = {"InsertLeave", "WinLeave", "TabLeave"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = true,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135,
        filetype_is_not = {"gitcommit"}
    }
)
----------------------------------------------------------------------
