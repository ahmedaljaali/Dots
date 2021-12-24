call plug#begin('~/.config/nvim-plugins')
"""""""""""""""""""""""""""""""""""""
"Theme And Colors
Plug 'joshdick/onedark.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'luochen1990/rainbow'            
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-emoji' 
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

"""""""""""""""""""""""""""""""""""""
"Moving Fast
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'szw/vim-maximizer'             

"""""""""""""""""""""""""""""""""""""
"Typing
Plug 'aserebryakov/vim-todo-lists'  
Plug 'lukas-reineke/indent-blankline.nvim'


"""""""""""""""""""""""""""""""""""""
"Language Support
Plug 'cdelledonne/vim-cmake'  
Plug 'alepez/vim-gtest' 

"""""""""""""""""""""""""""""""""""""
"toking with langauge server
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
"for nvim auto complete 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"""""""""""""""""""""""""""""""""""""
call plug#end()

filetype plugin on

source ~/.config/nvim/config/general.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Language Support

source ~/.config/nvim/config/language_support/cmake-config.vim
source ~/.config/nvim/config/language_support/spelling.vim
luafile ~/.config/nvim/config/language_support/treesitter-config.lua
luafile ~/.config/nvim/config/language_support/lsp-config.lua
luafile ~/.config/nvim/config/language_support/cmp-config.lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Theme

source ~/.config/nvim/config/themes/theme.vim
source ~/.config/nvim/config/themes/rainbowBraket.vim
source ~/.config/nvim/config/themes/airline.vim
source ~/.config/nvim/config/themes/icons.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast moving

source ~/.config/nvim/config/FM/start-screan.vim
source ~/.config/nvim/config/FM/fzfz.vim
source ~/.config/nvim/config/FM/splitControl.vim
source ~/.config/nvim/config/FM/fileStorm.vim
source ~/.config/nvim/config/FM/fff.vim
source ~/.config/nvim/config/FM/keymaps.vim
source ~/.config/nvim/config/FM/indent.lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
