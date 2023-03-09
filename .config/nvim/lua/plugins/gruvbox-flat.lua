return {
  'eddyekofo94/gruvbox-flat.nvim',
  lazy=false,
  config = function()
    vim.g.gruvbox_flat_style = "dark"
    vim.g.gruvbox_flat_style = "hard"
    vim.g.gruvbox_transparent = true
    vim.g.gruvbox_dark_sidebar = false

    vim.cmd[[colorscheme gruvbox-flat]]

  end
}
