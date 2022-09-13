local utils = require('usr.utils')
local lint = utils.include('lint')


-- cppcheck <= 1.84 doesn't support {column} so the start_col group is ambiguous
local pattern = [[([^:]*):(%d*):([^:]*): %[([^%]\]*)%] ([^:]*): (.*)]]
local groups = { 'file', 'lnum', 'col', 'code', 'severity', 'message' }
local severity_map = {
  ['error'] = vim.diagnostic.severity.ERROR,
  ['warning'] = vim.diagnostic.severity.WARN,
  ['performance'] = vim.diagnostic.severity.WARN,
  ['style'] = vim.diagnostic.severity.INFO,
  ['information'] = vim.diagnostic.severity.INFO,
}

require('lint').linters.custom_cppcheck = {
cmd = 'cppcheck',
  stdin = false,
  args = {
    '--enable=all',
    '--language=c++',
    '--inline-suppr',
    '--quiet',
    '--cppcheck-build-dir=../Build',
    '--project=compile_commands.json',
    '--template={file}:{line}:{column}: [{id}] {severity}: {message}',
  },
  stream = 'stderr',
  parser = require('lint.parser').from_pattern(pattern, groups, severity_map, { ['source'] = 'cppcheck' }),
}
----------------------------------------------------------------------
--                               Glsl                               --

lint.linters_by_ft =
{
    glsl = {'glslc'},
    cpp = {'custom_cppcheck'}
}
----------------------------------------------------------------------
