local util = require('packer.util')
local packer = require('packer')

----------------------------------------------------------------------------------------------------------------
--initialize packer
packer.init
{
  ensure_dependencies   = true, -- Should packer install plugin dependencies?
  package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
  plugin_package = 'packer', -- The default package for plugins
  max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
  auto_clean = true, -- During sync(), remove unused plugins
  compile_on_sync = true, -- During sync(), run packer.compile()
  disable_commands = false, -- Disable creating commands
  opt_default = false, -- Default to using opt (as opposed to start) plugins
  transitive_opt = true, -- Make dependencies of opt plugins also opt by default
  transitive_disable = true, -- Automatically disable dependencies of disabled plugins
  auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      update         = 'pull --ff-only --progress --rebase=false',
      install        = 'clone --depth %i --no-single-branch --progress',
      fetch          = 'fetch --depth 999999 --progress',
      checkout       = 'checkout %s --',
      update_branch  = 'merge --ff-only @{u}',
      current_branch = 'branch --show-current',
      diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt       = '%%h %%s (%%cr)',
      get_rev        = 'rev-parse --short HEAD',
      get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules     = 'submodule update --init --recursive --progress'
    },
    depth = 1, -- Git clone depth
    clone_timeout = 60, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    open_fn  = nil, -- An optional function to open a window for packer's display
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
  },
  luarocks = {
    python_cmd = 'python' -- Set the python command to use for running hererocks
  },
  log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  profile = {
    enable = true,
    threshold = 1, -- integer in milliseconds, pugins which load faster than this won't be shown in profile output
  }
}
----------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------
--if packer isn't installed install it
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
----------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------
--automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
----------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------
--install plugins
return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

---------------------------------------------------------
--Theme And Colors
  use 'joshdick/onedark.vim'
  use 'octol/vim-cpp-enhanced-highlight'
  use 'luochen1990/rainbow'
  use
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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
----------------------------------------------------------------------------------------------------------------
