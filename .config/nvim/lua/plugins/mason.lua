return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig'
  },
  config = function()
    local lspconfig = require('lspconfig')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("coq").lsp_ensure_capabilities(capabilities)

    require('mason').setup()
    local masonlsp = require('mason-lspconfig')

    masonlsp.setup({
      ensure_installed = {
        'bashls', 'clangd', 'cssls', 'dockerls', 'eslint', 'gradle_ls',
        'html', 'jsonls', 'jdtls', 'tsserver', 'sumneko_lua',
        'marksman', 'pyright', 'sourcery', 'sqlls', 'taplo',
        'tailwindcss', 'yamlls'
      },
      automatic_installation = true
    })

    masonlsp.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({capabilities = capabilities})
      end,
      ['emmet_ls'] = function()
        lspconfig.emmet_ls.setup({
          filetypes = {
            "html", "css", "javascriptreact", "typescriptreact",
            "htmldjango", "javascript", "typescript"
          }
        })
      end,
      ['html'] = function()
        lspconfig.html.setup({
          filetypes = {
            "html", "css", "javascriptreact", "typescriptreact",
            "htmldjango", "javascript", "typescript"
          }
        })
      end,
      ['tailwindcss'] = function()
        lspconfig.tailwindcss.setup({
          filetypes = {
            "html", "css", "javascriptreact", "typescriptreact",
            "htmldjango", "javascript", "typescript"
          },
          init_options = {userLanguages = {htmldjango = "html"}}

        })
      end,
      ['pyright'] = function()
        lspconfig.pyright.setup({
          typeCheckingMode = 'strict',
          disableOrganizeImports = false,
          analysis = {
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
            autoImportCompletions = true
          }
        })
      end,
      ['sourcery'] = function()
        lspconfig.sourcery.setup({
          init_options = {
            token = os.getenv("SOURCERY_TOKEN"),
            extension_version = 'vim.lsp',
            editor_version = 'vim'
          }
        })
      end
    })
  end
}
