local include = require('usr.utils').include
local trouble = include('trouble')


----------------------------------------------------------------------
--                              Setup                               --


trouble.setup
{
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = 'q', -- close the list
        cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
        refresh = 'r', -- manually refresh
        jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
        open_split = { '<c-x>' }, -- open buffer in new split
        open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
        open_tab = { '<c-t>' }, -- open buffer in new tab
        jump_close = { 'o' }, -- jump to the diagnostic and close the list
        toggle_mode = 'm', -- toggle between 'workspace' and 'document' diagnostics mode
        toggle_preview = 'P', -- toggle auto_preview
        hover = 'K', -- opens a small popup with the full multiline message
        preview = 'p', -- preview the diagnostic location
        close_folds = { 'zM', 'zm' }, -- close all folds
        open_folds = { 'zR', 'zr' }, -- open all folds
        toggle_fold = { 'zA', 'za' }, -- toggle fold of current file
        previous = 'k', -- preview item
        next = 'j' -- next item
    },

    -- position of the list can be: bottom, top, left, right
    position = 'bottom',

    -- height of the trouble list when position is top or bottom
    height = 10,

    -- width of the list when position is left or right
    width = 50,

    -- use devicons for filenames
    icons = true,

    -- 'workspace_diagnostics', 'document_diagnostics', 'quickfix', 'lsp_references', 'loclist'
    mode = 'workspace_diagnostics',

    -- icon used for open folds
    fold_open = '',

    -- icon used for closed folds
    fold_closed = '',

    -- group results by file
    group = true,

    -- add an extra new line on top of the list
    padding = true,

    -- add an indent guide below the fold icons
    indent_lines = true,

    -- automatically open the list when you have diagnostics
    auto_open = false,

    -- automatically close the list when you have no diagnostics
    auto_close = true,

    -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_preview = true,

    -- automatically fold a file trouble list at creation
    auto_fold = false,

    -- for the given modes, automatically jump if there is only a single result
    auto_jump = {'lsp_definitions'},

    -- icons / text used for a diagnostic
    signs = {
        error = '',
        warning = '',
        hint = '',
        information = '',
        other = '﫠'
    },

    -- enabling this will use the signs defined in your lsp client
    use_diagnostic_signs = false
}
----------------------------------------------------------------------
