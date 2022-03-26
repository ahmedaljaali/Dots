require('smart-splits').setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
  },
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = { 'NvimTree' },
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
})

-- resizing splits
-- amount defaults to 3 if not specified
-- use absolute values, no + or -
require('smart-splits').resize_up()
require('smart-splits').resize_down()
require('smart-splits').resize_left()
require('smart-splits').resize_right()
