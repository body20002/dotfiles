-- Format On Save
local formatCode = vim.api.nvim_create_augroup("formatCode ", {})
vim.api.nvim_create_autocmd("BufWritePre",
{pattern = {"*"}, command = "silent FormatWrite", group = formatCode})

-- Provides the Format and FormatWrite commands
return {
  'mhartington/formatter.nvim',
  lazy=true,
  keys={
    {"<Leader>F", ":FormatWrite<CR>", {noremap = true}, desc="Format And Save"}
  },
  cmd={
    "Format",
    "FormatWrite"
  },
  config = function()
    require("formatter").setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        },
        c = {require("formatter.filetypes.c").clangformat},
        cpp = {require("formatter.filetypes.cpp").clangformat},
        cs = {require("formatter.filetypes.cs").clangformat},
        css = {require("formatter.filetypes.css").prettier},
        html = {require("formatter.filetypes.css").prettier},
        javascript = {require("formatter.filetypes.javascript").prettier},
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier
        },
        json = {require("formatter.filetypes.json").prettier},
        lua = {require("formatter.filetypes.lua").luaformat},
        markdown = {require("formatter.filetypes.css").prettier},
        python = {
          function()
            return {
              exe = 'black',
              args = {'--line-length 120', "-q", "-"},
              stdin = true
            }
          end
        },
        toml = {require("formatter.filetypes.toml").taplo},
        typescript = {require("formatter.filetypes.typescript").prettier},
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier
        },
        xml = {require("formatter.filetypes.css").prettier},
        yaml = {require("formatter.filetypes.yaml").prettier}
      }
    }
  end
}
