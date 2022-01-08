-----------------------------------------------
--excute compile command
vim.g.cmake_link_compile_commands = true
vim.g.cmake_default_config = 'Build'
-----------------------------------------------

-----------------------------------------------
--give it the path to the executable and run it
vim.g['gtest#gtest_command'] = 'Build/app'
-----------------------------------------------
