return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup({
      auto_install = true,
      highlight = {enable = true},
      -- indent = {enable = true},
      incremental_selection = {enable = true},
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
      },
      autotag = {enable = true}
    })

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp
    .diagnostic
    .on_publish_diagnostics,
    {
      underline = true,
      virtual_text = {spacing = 5, severity_limit = 'Warning'},
      update_in_insert = true
    })
  end,
  dependencies = {'windwp/nvim-ts-autotag', 'p00f/nvim-ts-rainbow'}
}

