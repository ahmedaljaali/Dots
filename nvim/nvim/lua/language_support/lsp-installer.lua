local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  server:setup({
    on_attach = on_attach
  })
end)


lsp_installer.settings({

    ui = {
        icons = {
            -- The list icon to use for installed servers.
            server_installed = "✓",
            -- The list icon to use for servers that are pending installation.
            server_pending = "➜",
            -- The list icon to use for servers that are not installed.
            server_uninstalled = "✗"
        },
    },

    -- The directory in which to install all servers.
    install_root_dir = os.getenv ( "HOME" ) .."/.local/share/nvim/lsp_servers",

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- make sure that they are installed
    ensure_installed = { "clangd", "sumneko_lua", "jsonls", "cmake", "vimls" },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with server installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    -- servers that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,

})
