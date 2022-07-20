local tabline = require('tabline_framework')

----------------------------------------------------------------------
--                              Colors                              --

local inactive = {
    black = '#282828',
    white = '#f2e5bc',
    fg = '#696969',
    bg_1 = '#181A1F',
    bg_2 = '#282828',
    index = '#d19a66',
}

local active = vim.tbl_extend('force', inactive, {
fg = '#abb2bf',
bg_2 = '#1d2021',
index = '#83a598',
})
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          The main thing                          --

local render = function(f)
    f.make_tabs(function(info)
        local colors = info.current and active or inactive

        f.add {
            ' ' .. info.index .. ' ',
            fg = colors.index,
            bg = colors.bg_1
        }

        f.set_colors { fg = colors.fg, bg = colors.bg_2 }

        f.add ' '
        if info.filename then
            f.add(info.filename)
            f.add {
            ' ' .. f.icon(info.filename),
            fg = info.current and f.icon_color(info.filename) or nil
            }
            f.add(info.modified and ' +')
        end
    f.add ' '
    f.add { ' ', bg = colors.black }
    end)

    -- f.add_spacer()

    -- local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    -- local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

    -- f.add { '  ' .. errors, fg = "#e86671" }
    -- f.add { '  ' .. warnings, fg = "#e5c07b"}
    -- f.add ' '
end
----------------------------------------------------------------------


----------------------------------------------------------------------
--                          Setup tabline                           --

tabline.setup {
render = render,
hl = { fg = '#abb2bf', bg = '#181A1F' },
hl_sel = { fg = '#abb2bf', bg = '#282c34'},
hl_fill = { fg = '#ffffff', bg = '#282828'},
}
----------------------------------------------------------------------
