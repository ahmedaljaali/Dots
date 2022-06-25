vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

require('spellsitter').setup {
  -- Whether enabled, can be a list of file types, e.g. {'python', 'lua'}
  enable = true,
  code_spellcheck = false, -- enable additional code spellchecks
  naming_styles = {'camel_case', 'snake_case'}  -- how to parse names to separate words
}

vim.cmd[[set nospell filetype=terminal]] --disable it while using terminal
