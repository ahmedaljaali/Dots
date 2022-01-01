---------------------------------------------------------
--if packer isn't installed install it
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
---------------------------------------------------------

---------------------------------------------------------
--automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
---------------------------------------------------------










return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

---------------------------------------------------------
--Theme And Colors
  use 'joshdick/onedark.vim'
  use 'octol/vim-cpp-enhanced-highlight'
  use 'luochen1990/rainbow'
  use
  {
    'vim-airline/vim-airline',
    requires = {{'vim-airline/vim-airline-themes'}}
  }
  use 'junegunn/vim-emoji'
  use 'mhinz/vim-startify'
  use 'ryanoasis/vim-devicons'
  use 'mtdl9/vim-log-highlighting'

---------------------------------------------------------
--Moving Fast
  use
  {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install'](0) end,
    requires = {{'junegunn/fzf.vim'}}
  }
  use 'voldikss/vim-floaterm'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'szw/vim-maximizer'

---------------------------------------------------------
--Typing
  use 'aserebryakov/vim-todo-lists'
  use 'lukas-reineke/indent-blankline.nvim'


---------------------------------------------------------
--Language Support
  use 'cdelledonne/vim-cmake'
  use 'alepez/vim-gtest'

---------------------------------------------------------
--toking with langauge server
  use
  {
    'nvim-treesitter/nvim-treesitter',
    run = function() vim.fn[':TSUpdate'](0) end
  }
  use
  {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
---------------------------------------------------------

---------------------------------------------------------
  --for nvim auto complete
  use
  {
    'hrsh7th/nvim-cmp',
    requires = {{'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp',}}
  }
---------------------------------------------------------

  --if packer isn't installed install it
 if packer_bootstrap then
    require('packer').sync()
  end
end)
