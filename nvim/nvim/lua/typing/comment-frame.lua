local utils = require('usr.utils')
local commentFrame = utils.include('nvim-comment-frame')

----------------------------------------------------------------------
--                       Setup comment frame                        --

commentFrame.setup({

    keymap = '<leader>cc',
    --       ^^^^^^^^^^^ change this to what ever you want

    multiline_keymap = '<leader>C',
    --                 ^^^^^^^^^^^ change this to what ever you want

    -- if true, <leader>cf keymap will be disabled
    disable_default_keymap = true,

    -- start the comment with this string
    start_str = '/*',

    -- end the comment line with this string
    end_str = '*/',

    -- fill the comment frame border with this character
    fill_char = '-',

    -- width of the comment frame
    frame_width = 70,

    -- wrap the line after 'n' characters
    line_wrap_len = 50,

    -- automatically indent the comment frame based on the line
    auto_indent = true,

    -- add comment above the current line
    add_comment_above = true,

    -- configurations for individual language goes here
    languages = {
        cpp = {
            -- start the comment with this string
            start_str = '/*',

            -- end the comment line with this string
            end_str = '*/',

            -- fill the comment frame border with this character
            fill_char = '-',

            -- automatically indent the comment frame based on the line
            auto_indent = true,

        },
    }
})
----------------------------------------------------------------------
