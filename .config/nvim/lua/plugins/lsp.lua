return {
  'neovim/nvim-lspconfig',
  lazy=true,
  keys={
    {'gD', vim.lsp.buf.declaration, {noremap = true, silent = true}, desc="Go To Declaration", mode='n'},
    {'gi', vim.lsp.buf.implementation, {noremap = true, silent = true}, desc="Go To Implementation", mode='n'},
    {"K", vim.lsp.buf.hover, {silent = true}, desc="Show Info", mode="n"},
    {"<leader>k", vim.lsp.buf.signature_help, {silent = true, noremap = true}, desc="Show Signature", mode="n"},
    {'<Leader>gr', vim.lsp.buf.references, {noremap = true, silent = true}, desc="Go To References", mode='n'},
    {'<Leader>D', vim.lsp.buf.type_definition, {noremap = true, silent = true}, desc="Show Type Definition", mode='n'},
  }
}
