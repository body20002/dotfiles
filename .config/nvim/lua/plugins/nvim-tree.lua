vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd({ "UIEnter" }, { callback = function(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end })

return {
  'kyazdani42/nvim-tree.lua',
  dependencies = 'kyazdani42/nvim-web-devicons',
  lazy=false,
  keys={
    {'<C-\\>', ':NvimTreeToggle<CR>', {noremap = true, silent = true}, desc="Toggle NvimTree"}
  },
  opts={
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    view = {
      adaptive_size = true,
      mappings = {list = {{key = "u", action = "dir_up"}}},
      side = "left"
    },
    renderer = {
      group_empty = true,
      indent_markers = {
        enable = true,
        icons = {corner = "└ ", edge = "│ ", item = "│ ", none = "  "}
      }
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {hint = "", info = "", warning = "", error = ""}
    },
    filters = {dotfiles = true},
    filesystem_watchers = {enable = true, debounce_delay = 50}
  }
}
