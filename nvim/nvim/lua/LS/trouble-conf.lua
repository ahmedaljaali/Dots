local trouble = require("trouble")


----------------------------------------------------------------------
--                              Setup                               --


trouble.setup
{
    -- position of the list can be: bottom, top, left, right
    position = "bottom",

    -- height of the trouble list when position is top or bottom
    height = 10,

    -- width of the list when position is left or right
    width = 50,

    -- use devicons for filenames
    icons = true,

    -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    mode = "workspace_diagnostics",

    -- icon used for open folds
    fold_open = "",

    -- icon used for closed folds
    fold_closed = "",

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
    auto_jump = {"lsp_definitions"},

    -- icons / text used for a diagnostic
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },

    -- enabling this will use the signs defined in your lsp client
    use_diagnostic_signs = false
}
----------------------------------------------------------------------
