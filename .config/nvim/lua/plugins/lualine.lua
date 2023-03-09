return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-material',
      component_separators = {left = '|', right = '|'},
      section_separators = {left = '', right = ''},
      disabled_filetypes = {"NvimTree", "packer"},
      always_divide_middle = true,
      globalstatuses = true
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        'branch', 'diff', {
          'diagnostics',
          sources = {'nvim_lsp', 'coc'},
          update_in_insert = true,
          always_visible = true
        }
      },
      lualine_c = {{'filename', file_status = true, path = 1}},
      lualine_x = {'filetype'},
      lualine_y = {'%p%%', 'location'},
      lualine_z = {}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {{'filename', file_status = true, path = 1}},
      lualine_x = {'filetype'},
      lualine_y = {'%p%%', 'location'},
      lualine_z = {}
    },
    tabline = {},
    extensions = {"fugitive", "fzf", "nvim-tree"}
  }
}
