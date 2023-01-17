local lsp_installer = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities = require("coq").lsp_ensure_capabilities(capabilities)


lsp_installer.on_server_ready(function(server)
    local opts = {capabilities = capabilities}

    if server.name == "emmet_ls" then
        opts.filetypes = {"html", "css", "javascriptreact", "typescriptreact", "htmldjango", "javascript", "typescript"}
    end
    if server.name == "html" then
        opts.filetypes = {"html", "css", "javascriptreact", "typescriptreact", "htmldjango", "javascript", "typescript"}
    end
    if server.name == "tailwindcss" then
        opts.filetypes = {"html", "css", "javascriptreact", "typescriptreact", "htmldjango", "javascript", "typescript"}
    end
    -- if server.name == "eslint" then
    --     opts.filetypes = {"html", "css", "javascriptreact", "typescriptreact", "htmldjango"}
    -- end
    -- if server.name == "cssls" then
    --     opts.filetypes = {"html", "css", "javascriptreact", "typescriptreact", "htmldjango"}
    -- end
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

    if server.name == "tailwindcss" then
        opts.init_options = {
          userLanguages = {htmldjango = "html"}
        }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

