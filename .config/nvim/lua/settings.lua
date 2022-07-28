-- I'm lazy
local opt = vim.opt

-- Nice Number Line
opt.relativenumber = true
opt.number = true

-- Tabs & Spaces
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Column Settings
opt.signcolumn = "auto:4"
opt.colorcolumn = "120"
opt.wrap = false

-- Cursor Settings
opt.cursorline = true
opt.guicursor =
    "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkoff1-blinkon1"

-- Window Settings
opt.splitbelow = true
opt.splitright = true
opt.lazyredraw = true
opt.showtabline = 2

-- Spelling
opt.spell = true
opt.spelloptions = "camel"

-- Other
opt.mouse = 'a'
opt.showmode = false
opt.termguicolors = true
opt.hidden = true
opt.clipboard = "unnamedplus"
opt.formatoptions = "jql"
opt.laststatus = 3
opt.completeopt = {"menu", "menuone", "preview"}
