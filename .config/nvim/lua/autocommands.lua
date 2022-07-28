local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Packer
local packerUserConfig = augroup("packerUserConfig", {})
autocmd("BufWritePost", {
    pattern = {"plugins.lua"},
    command = "source <afile> | PackerCompile",
    group = packerUserConfig
})

-- Indentaion
local indentaion = augroup("indentaion", {})
autocmd("FileType", {
    pattern = {
        "html", "css", "scss", "javascript", "javascriptreact", "typescript",
        "typescriptreact", "lua", "markdown"
    },
    command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
    group = indentaion
})

-- Highlight yanked text
local highlightYank = augroup("highlightYank", {})
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({higroup = "Visual", timeout = 300})
    end,
    group = highlightYank
})

-- Center Screen On Insert

autocmd("InsertEnter", {pattern = "*", command = "norm zz"})

-- Format On Save
local formatCode = augroup("formatCode ", {})
autocmd("BufWritePre",
        {pattern = {"*"}, command = "silent FormatWrite", group = formatCode})

-- Opens PDF files in PDFVIWER/BROWSER which is defined in the environment variables
-- instead of viewing the binary in Neovim
local openPDF = augroup("openPDF", {})
autocmd("BufReadPost", {
    pattern = {"*.pdf"},
    callback = function()
        local command

        ---@diagnostic disable-next-line: param-type-mismatch
        if pcall(os.getenv("PDFVIWER")) then
            command = os.getenv("PDFVIWER")
        else
            command = os.getenv("BROWSER")
        end

        vim.fn.jobstart(string.format("%s '%s'", command, vim.fn.expand("%")),
                        {detach = true})
        vim.api.nvim_buf_delete(0, {})
    end,
    group = openPDF
})

-- Open media files in BROWSER
-- TODO: Add support for other file types & commands
local openMediaFiles = augroup("openMediaFiles", {})
autocmd("BufReadPost", {
    pattern = {"*.png", "*.webp", "*.jpg", "*.jpeg", "*.mp4"},
    callback = function()
        local command = os.getenv("BROWSER")
        vim.fn.jobstart(string.format("%s '%s'", command, vim.fn.expand("%")),
                        {detach = true})
        vim.api.nvim_buf_delete(0, {})
    end,
    group = openMediaFiles
})

-- Save/restore code folds
local saveFolds = augroup("saveFolds", {})
autocmd("BufWritePost",
        {pattern = "?*", command = "silent mkview", group = saveFolds})
autocmd("BufReadPost",
        {pattern = "?*", command = "silent! loadview", group = saveFolds})

-- Clear Message Area (Not Working :/)
-- vim.cmd([[
-- function! s:empty_message(timer)
--   if mode() ==# 'n'
--     echon ''
--   endif
-- endfunction

-- augroup cmd_msg_cls
--     autocmd!
--     autocmd CmdlineLeave :  call timer_start(5000, funcref('s:empty_message'))
-- augroup END
-- ]])
