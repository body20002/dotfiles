-- Provides the Format and FormatWrite commands
require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        ["*"] = {require("formatter.filetypes.any").remove_trailing_whitespace},
        c = {require("formatter.filetypes.c").clangformat},
        cpp = {require("formatter.filetypes.cpp").clangformat},
        cs = {require("formatter.filetypes.cs").clangformat},
        css = {require("formatter.filetypes.css").prettierd},
        html = {require("formatter.filetypes.css").prettierd},
        javascript = {require("formatter.filetypes.javascript").prettierd},
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd
        },
        json = {require("formatter.filetypes.json").prettierd},
        lua = {require("formatter.filetypes.lua").luaformat},
        markdown = {require("formatter.filetypes.css").prettierd},
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
        typescript = {require("formatter.filetypes.typescript").prettierd},
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd
        },
        xml = {require("formatter.filetypes.css").prettierd},
        yaml = {require("formatter.filetypes.yaml").prettierd}
    }
}
