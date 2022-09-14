M = {}
----------------------------------------------------------------------
--                              Locals                              --
local notify = require('notify').async

local async = require('plenary.async')

-- Log levels
local ERROR = vim.log.levels.ERROR
local WARN  = vim.log.levels.WARN
local INFO  = vim.log.levels.INFO
----------------------------------------------------------------------




-- I don't know how to let it get the name of the file that raised the error
local function filename()
    local str = debug.getinfo(2, 'S').source:sub(2)
    return str:match('^.*/(.*).lua$') or str
end


-- Logging
local function log(message, level, title)
    async.run(function()
        notify(message, level, {title = title})
    end)
end

-- Check if it's already loaded
local function checkIfLoaded(modname)
    for key in pairs(package.loaded) do
        if key == modname then
            return true
        else
            return false
        end
    end
end

function M.osExecute(cmd)
    local fileHandle     = assert(io.popen(cmd, 'r'))
    local commandOutput  = assert(fileHandle:read('*a'))
    local returnTable    = {fileHandle:close()}
    return commandOutput ,returnTable[3]
end

function M.include(modname)

    local status_ok, mod= pcall(require, modname)

    if not status_ok and not checkIfLoaded(modname) then
        log('Can\'t load ' .. modname.. '!!!', ERROR, modname)

        return function() return {"LoL"} end
    else
        return mod
    end
end


return M
