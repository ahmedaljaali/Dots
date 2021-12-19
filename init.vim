call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'https://github.com/szw/vim-maximizer.git'
Plug 'junegunn/vim-emoji'                          " Vim emojis!
Plug 'kamykn/spelunker.vim'
Plug 'aserebryakov/vim-todo-lists'
Plug 'cdelledonne/vim-cmake'
Plug 'alepez/vim-gtest'
call plug#end()

filetype plugin on

source ~/.config/nvim/config/language_support/spelling.vim
source ~/.config/nvim/config/themes/theme.vim
source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/themes/rainbowBraket.vim
source ~/.config/nvim/config/themes/airline.vim
source ~/.config/nvim/config/FM/fzfz.vim
source ~/.config/nvim/config/FM/splitControl.vim
source ~/.config/nvim/config/FM/fileStorm.vim
source ~/.config/nvim/config/FM/fff.vim
