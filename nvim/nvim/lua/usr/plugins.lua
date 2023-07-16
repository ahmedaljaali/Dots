local packerUtil = require('packer.util')
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

     -- Should packer install plugin dependencies?
    ensure_dependencies = true,

    package_root = packerUtil.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),

    compile_path = os.getenv('HOME') .. '/.local/share/nvim/plugin/packer_compiled.lua',

     -- The default package for plugins
    plugin_package = 'packer',

     -- Limit the number of simultaneous jobs. nil means no limit
    max_jobs = nil,

    -- During sync(), remove unused plugins
    auto_clean = true,

    -- During sync(), run packer.compile()
    compile_on_sync = true,

    -- Disable creating commands
    disable_commands = false,

    -- Default to using opt (as opposed to start) plugins
    opt_default = false,

    -- Make dependencies of opt plugins also opt by default
    transitive_opt = true,

    -- Automatically disable dependencies of disabled plugins
    transitive_disable = true,

    -- Automatically reload the compiled file after creating it.
    auto_reload_compiled = true,
    git = {
         -- The base command for git operations
        cmd = 'git',

         -- Format strings for git subcommands
        subcommands = {
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

        -- Git clone depth
        depth = 1,

        -- Timeout, in seconds, for git clones
        clone_timeout = 120,

        -- Lua format string used for 'aaa/bbb' style plugins
        default_url_format = 'https://github.com/%s'
    },
    display = {
        -- If true, disable display windows for all operations
        non_interactive = false,

        -- An optional function to open a window for packer's display
        open_fn  = nil,

        -- An optional command to open a window for packer's display
        open_cmd = '65vnew \\[packer\\]',

        -- The symbol for a plugin being installed/updated
        working_sym = '⏲️ ',

        -- The symbol for a plugin with an error in installation/updating
        error_sym = '😞',

        -- The symbol for a plugin which has completed installation/updating
        done_sym = '👍',

        -- The symbol for an unused plugin which was removed
        removed_sym = '👋',

        -- The symbol for a plugin which was moved (e.g. from opt to start)
        moved_sym = '→',

        -- The symbol for the header line in packer's display
        header_sym = '━',

        -- Should packer show all update details automatically?
        show_all_info = true,

        -- Border style of prompt popups.
        prompt_border = 'double',

        -- Keybindings for the display window
        keybindings = {
            quit = 'q',
            toggle_info = '<CR>',
            diff = 'd',
            prompt_revert = 'r',
        }
    },
    luarocks = {
        -- Set the python command to use for running hererocks
        python_cmd = 'python'
    },

    -- The default print log level. One of: 'trace', 'debug', 'info', 'warn', 'error', 'fatal'.
    log = { level = 'warn' },
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


    -- Onedark theme
    use 'navarasu/onedark.nvim'

    --A Vim plugin to colorize all text in the form #rrggbb or #rgb.
    use 'lilydjwg/colorizer'

    use 'HiPhish/nvim-ts-rainbow2'

    -- Status line
    use
    {
        'nvim-lualine/lualine.nvim',
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true}
        }
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Log file highlighting
    use 'mtdl9/vim-log-highlighting'

    -- Gruvbox theme
    use 'ellisonleao/gruvbox.nvim'

    -- Vim support for editing fish scripts
    use 'Stautob/vim-fish'

    -- Neovim plugin to improve the default vim.ui interfaces
    use 'stevearc/dressing.nvim'

    -- A powerful Neovim plugin that lets users choose & modify RGB/HSL/HEX colors
    use 'ziontee113/color-picker.nvim'

    -- Tabline
    use
    {
        'rafcamlet/tabline-framework.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', -- If you want devicons
        }
    }

    -- Notification manager
    use 'rcarriga/nvim-notify'

----------------------------------------------------------------------


----------------------------------------------------------------------
--                           Moving Fast                            --



    -- U know, telescope
    use
    {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            --[['nvim-lua/popup.nvim' 'packer complain about Repetition']]
        }
    }

    -- Terminal
    use 'voldikss/vim-floaterm'


    -- Fix CursorHold Performance.
    use 'antoinemadec/FixCursorHold.nvim'

    -- Maximize splits
    use 'szw/vim-maximizer'

    -- Start screen
    use 'mhinz/vim-startify'

    -- Change line color depending on the mode
    use 'mvllow/modes.nvim'

    -- Set of operators and textobjects to search/select/edit sandwiched texts.
    use 'machakann/vim-sandwich'

    -- Show project structure
    use
    {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- Neovim plugin to stabilize window open/close events.
    use 'luukvbaal/stabilize.nvim'

    -- Use sudo to write file
    use 'lambdalisue/suda.vim'

    -- Show registers
    use 'tversteeg/registers.nvim'

    -- Neovim motions on speed!
    use 'phaazon/hop.nvim'

----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Typing                              --


    -- For indentation
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopare
    use 'windwp/nvim-autopairs'

    -- Comment plugins
    use 'numToStr/Comment.nvim'

    -- Remove trailing white spaces and empty lines
    use 'McAuleyPenney/tidy.nvim'

    -- Reopen files at your last edit position
    use 'ethanholz/nvim-lastplace'

    -- From it's name
    use '907th/vim-auto-save'

    -- Todo
    use
    {
        'folke/todo-comments.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    --From it's name :)
    use 'mbbill/undotree'

    -- Frame Your comments
    use
    {
        's1n7ax/nvim-comment-frame',
        requires  = {
            'nvim-treesitter'
        }
    }

    -- Yank history
    use 'AckslD/nvim-neoclip.lua'

    -- Increment/decrements
    use 'monaqa/dial.nvim'

    -- Keep your cursor at the center of the screen
    use 'arnamak/stay-centered.nvim'

----------------------------------------------------------------------
--                         Language Support                         --

    -- An implementation of the Popup API from vim in Neovim
    use
    {
        'nvim-lua/popup.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Cmake support
    use 'cdelledonne/vim-cmake'

    -- Snippet support
    use
    {
        'L3MON4D3/LuaSnip',

        requires = {
            'benfowler/telescope-luasnip.nvim', 'saadparwaiz1/cmp_luasnip'
        }
    }

    -- For neovim lsp completion items
    use
    {
        'onsails/lspkind-nvim',
    }

    -- Code actions
    use
    {
        'weilbith/nvim-code-action-menu',
    }

    -- Show diagnosis
    use
    {
        'folke/trouble.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
    }

    -- A tree like view for symbols
    use 'simrat39/symbols-outline.nvim'

    -- UI for nvim-lsp progress
    use
    {
        'j-hui/fidget.nvim',
        tag = 'legacy'
    }

    -- Highlight arguments' definitions and usages, using Treesitter
    use
    {
        'm-demare/hlargs.nvim',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        }
    }

    -- Signature help
    use 'ray-x/lsp_signature.nvim'

    -- Show the top of a function or a class
    use 'romgrk/nvim-treesitter-context'

    -- Hex editing
    use 'fidian/hexmode'

    -- U know it
    use
    {
        'nvim-treesitter/nvim-treesitter',
        commit = '3e316204f8ec8450bbaace69d0bf8fe332633fec';
        run = function() vim.fn[':TSUpdate'](0) end
    }

    -- Install language servers and tools
    use
    {
        'williamboman/mason.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim'
    }

    -- Configure language servers
    use 'neovim/nvim-lspconfig'

    -- Help for builtin lua functions
    use 'milisims/nvim-luaref'

    -- Auto completion
    use
    {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-path',  'f3fora/cmp-spell',
            'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp',
            -- {'tzachar/cmp-tabnine', run='./install.sh'}, --NOTE: Eats a lot of memory!
            'lukas-reineke/cmp-under-comparator', 'hrsh7th/cmp-emoji',
            'kdheepak/cmp-latex-symbols', 'hrsh7th/cmp-calc',
        }
    }

    -- Debugging
    use
    {
        'mfussenegger/nvim-dap',
        requires = {
            'theHamsta/nvim-dap-virtual-text', 'rcarriga/nvim-dap-ui'
        }
    }

    -- Fill the gaps for languages where there is no language server exists
    use 'mfussenegger/nvim-lint'

    -- Nvim auto completion
    use 'folke/neodev.nvim'
----------------------------------------------------------------------


----------------------------------------------------------------------
--                              Random                              --


    -- Make missing directories
    use 'jghauser/mkdir.nvim'

    -- Measure startup time
    use 'dstein64/vim-startuptime'

    -- Tetris 🎮
    use 'alec-gibson/nvim-tetris'

    -- SQLite/LuaJIT binding for lua and neovim
    use 'kkharji/sqlite.lua'

    -- Viewing URLs
    use 'axieax/urlview.nvim'
----------------------------------------------------------------------


  --if packer isn't installed install it
 if packer_bootstrap then
    require('packer').sync()
  end
end)
----------------------------------------------------------------------
