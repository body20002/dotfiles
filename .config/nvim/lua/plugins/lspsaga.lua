return {
  "glepnir/lspsaga.nvim",
  lazy=true,
  keys={
    {"<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", {silent = true, noremap = true}, desc="Range Code Action", mode="v"},
    {"<leader>ca", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true}, desc="Code Action", mode="n"},

    {"<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", {silent = true, noremap = true}, desc="Show Line Diagnostics", mode="n"},
    {'<Leader>[', "<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true}, desc="Jump To The Next Diagnostics", mode='n'},
    {'<Leader>]', "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true}, desc="Jump To The Previous Diagnostics", mode='n'},

    {"<Leader>T", "<cmd>Lspsaga open_floaterm<CR>", {silent = true}, desc="Open Float Term", mode="n"},
    {"<Leader>T", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], {silent = true}, desc="Close Float Term", mode="t"},

    {"gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true}, desc="Rename", mode="n"},
    {"gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true, noremap = true}, desc="LSP Finder", mode="n"},
    {"gd", "<cmd>Lspsaga peek_definition<CR>", {silent = true}, desc="Peek Definition", mode="n"},
  },
  branch = "main",
  opts = {border_style = "rounded"},
  dependencies='neovim/nvim-lspconfig'
}
