local lsp_installer = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
    local opts = {capabilities = capabilities}

    if server.name == "emmet_ls" then
        opts.filetypes = {"html", "css", "javascriptreact", "typescriptreact"}
    end
    if server.name == "pyright" then
        opts.analysis = {
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
            autoImportCompletions = true
        }
    end
    if server.name == "sourcery" then
        opts.init_options = {
            token = os.getenv("SOURCERY_TOKEN"),
            extension_version = 'vim.lsp',
            editor_version = 'vim'
        }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

