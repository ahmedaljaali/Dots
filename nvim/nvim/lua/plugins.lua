local util = require('packer.util')
local packer = require('packer')

----------------------------------------------------------------------
--              if packer isn't installed, install it               --

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
----------------------------------------------------------------------


----------------------------------------------------------------------
--                           init packer                            --

packer.init
{
  status = true,
  ensure_dependencies   = true, -- Should packer install plugin dependencies?
  package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  compile_path = os.getenv("HOME") .. '/.local/share/nvim/plugin/packer_compiled.lua',
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
    clone_timeout = 120, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    open_fn  = nil, -- An optional function to open a window for packer's display
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⏲️ ', -- The symbol for a plugin being installed/updated
    error_sym = '😞', -- The symbol for a plugin with an error in installation/updating
    done_sym = '👍', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '👋', -- The symbol for an unused plugin which was removed
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
  }
}
----------------------------------------------------------------------



----------------------------------------------------------------------
--                         install plugins                          --

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


----------------------------------------------------------------------
--                         Theme and colors                         --


  use 'navarasu/onedark.nvim'
  use 'lilydjwg/colorizer'
  use 'octol/vim-cpp-enhanced-highlight'
  use 'p00f/nvim-ts-rainbow'
  use
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'mtdl9/vim-log-highlighting'
  use 'elkowar/yuck.vim'
  use "ellisonleao/gruvbox.nvim"
  use "Stautob/vim-fish"
  use 'stevearc/dressing.nvim'
  use "ziontee113/color-picker.nvim"
  use
  {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
  }

----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Moving fast                            --


  use
  {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim',--[['nvim-lua/popup.nvim' "packer complain about Repetition"]] }}
  }
  use 'voldikss/vim-floaterm'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'szw/vim-maximizer'
  use 'mhinz/vim-startify'
  use 'kevinhwang91/rnvimr'
  use 'mvllow/modes.nvim'
  use 'machakann/vim-sandwich'
  use
  {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  use 'luukvbaal/stabilize.nvim'
  use 'lambdalisue/suda.vim'
  use "tversteeg/registers.nvim"
  use "anuvyklack/hydra.nvim"
  use 'phaazon/hop.nvim'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Typing                              --


  use 'lukas-reineke/indent-blankline.nvim'
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use 'danilamihailov/beacon.nvim'
  use "McAuleyPenney/tidy.nvim" --remove trailing whitespace and empty lines
  use 'ethanholz/nvim-lastplace' --reopen files at your last edit position
  use "Pocco81/AutoSave.nvim" -- :)
  use --Fix list
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use
  {
    'lewis6991/spellsitter.nvim',
    requires = {'nvim-treesitter/nvim-treesitter'},
  }
  use 'mbbill/undotree' --From it's name :)
  use
  {
    's1n7ax/nvim-comment-frame',
    requires  = {'nvim-treesitter'}
  }
  use   "AckslD/nvim-neoclip.lua"
  use 'monaqa/dial.nvim'
  use "arnamak/stay-centered.nvim"

----------------------------------------------------------------------
--                         Language support                         --


  use
  {
    'nvim-lua/popup.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }

  use
  {
      'cdelledonne/vim-cmake',
  }
  use
  {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  -- tag = 'release' -- To use the latest release
  }
  use 'L3MON4D3/LuaSnip' --snipts
  use
  {
      'onsails/lspkind-nvim', --pictograms for neovim lsp completion items
      commit = '44f686c71e4bf515b2878e10445cb8ed7f351488' --The newer commits are broken
  }
  use
  {
    'weilbith/nvim-code-action-menu',
  }
  use --nvim lua support
  {
    'folke/lua-dev.nvim',
  }
  use
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 'simrat39/symbols-outline.nvim'
  use 'andymass/vim-matchup'
  use 'j-hui/fidget.nvim' --check if the server is ready
  use
  {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use "ray-x/lsp_signature.nvim"
  use 'romgrk/nvim-treesitter-context'
  use 'fidian/hexmode' --add hex editing

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

  use "milisims/nvim-luaref" --help for builtin lua fucntion

  use
  {
    'hrsh7th/nvim-cmp',
    requires = {{'hrsh7th/cmp-path',  'f3fora/cmp-spell',
                'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp',
                'saadparwaiz1/cmp_luasnip', {'tzachar/cmp-tabnine', run='./install.sh'},
                "lukas-reineke/cmp-under-comparator", "hrsh7th/cmp-emoji",
                "kdheepak/cmp-latex-symbols", "hrsh7th/cmp-calc",}}
  }
  use
  {
    "benfowler/telescope-luasnip.nvim",
  }
  use 'tamago324/nlsp-settings.nvim'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Random                              --


  use
  {
    'jghauser/mkdir.nvim',
  }
  use 'dstein64/vim-startuptime' --measur the startup time
  use 'alec-gibson/nvim-tetris' --tetis 🎮
----------------------------------------------------------------------


  --if packer isn't installed install it
 if packer_bootstrap then
    require('packer').sync()
  end
end)
----------------------------------------------------------------------
