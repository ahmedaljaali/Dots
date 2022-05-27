require('hlargs').setup {
  color = "#FF6D6D",
  excluded_filetypes = {},
  paint_arg_declarations = true,
  paint_arg_usages = true,
  performance = {
    parse_delay = 1,
    max_iterations = 400
  }
}

-- After setup, the plugin will be enabled. You can enable/disable/toggle it using:
-- require('hlargs').enable()
-- require('hlargs').disable()
-- require('hlargs').toggle()
