let g:cmake_link_compile_commands = 1

nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>


""""""""""""""""""""""""""""""""""""""""""""""
"give it the path to the executable and run it
let g:gtest#gtest_command = "Debug/app"
nmap <leader>tr :GTestRun<cr>

""""""""""""""""""""""""""""""""""""""""""""""
