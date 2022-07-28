local map = vim.keymap.set
local cmd = vim.cmd

-- Easy wq
cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa xall')
cmd(':command! Waq xall')
cmd(':command! W w')
cmd(':command! Q q')

-- Set up <Space> to be the leader key
map('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Easy :
map("n", ";", ":", {noremap = true})

-- Easy Normal Mode
map("i", "jk", "<Esc>", {noremap = true})
map("i", "jk", "<Esc>", {noremap = true})
map("i", "KJ", "<Esc>", {noremap = true})
map("i", "JK", "<Esc>", {noremap = true})

-- Easy Movement
map('n', 'w', '<Plug>CamelCaseMotion_w', {silent = true})
map('n', 'b', '<Plug>CamelCaseMotion_b', {silent = true})
map('n', 'e', '<Plug>CamelCaseMotion_e', {silent = true})
map('n', 'ge', '<Plug>CamelCaseMotion_ge', {silent = true})

map('v', 'w', '<Plug>CamelCaseMotion_w', {silent = true})
map('v', 'b', '<Plug>CamelCaseMotion_b', {silent = true})
map('v', 'e', '<Plug>CamelCaseMotion_e', {silent = true})
map('v', 'ge', '<Plug>CamelCaseMotion_ge', {silent = true})

-- Easy Resize
map("n", "<M-h>", ":vertical resize -2<CR>", {noremap = true})
map("n", "<M-j>", ":resize +2<CR>", {noremap = true})
map("n", "<M-k>", ":resize -2<CR>", {noremap = true})
map("n", "<M-l>", ":vertical resize +2<CR>", {noremap = true})

-- Easy Capitalization
map("n", "<F7>", "<Esc>V:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>", {})
map("v", "<F7>", "<Esc>V:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>", {})
map("i", "<F7>", "<Esc>V:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>i", {})

-- STOP USING THE ARROW KEYS !!
-- map('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
-- map('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
-- map('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
-- map('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})

-- Comments
map('n', '<C-_>', ":lua require('Comment.api').toggle_current_linewise()<CR>",
    {noremap = true, silent = true})
map('v', '<C-_>',
    ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
    {noremap = true, silent = true})
map('i', '<C-_>',
    "<Esc>:lua require('Comment.api').toggle_current_linewise()<CR>i",
    {noremap = true, silent = true})

-- Keybinds Reloading Init Files
map('n', '<Leader>vr', '<Cmd>luafile $MYVIMRC<CR>', {noremap = true})

-- Saving Files With <C-S>
map('n', '<C-s>', ':up!<CR>', {noremap = true, silent = true})
map('i', '<C-s>', '<Esc>:up!<CR>', {noremap = true, silent = true})
map('v', '<C-s>', '<Esc>:up!<CR>', {noremap = true, silent = true})

-- Deleting Words With <C-Bs>
map('i', '', '<C-w>', {noremap = true, silent = true})
map('c', '', '<C-w>', {noremap = true, silent = true})
map('i', '<C-BS>', '<C-w>', {noremap = true, silent = true})
map('c', '<C-BS>', '<C-w>', {noremap = true})

-- NvimTree
map('n', '<C-\\>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Better Indent/Unintend Lines And Blocks Of Text
map('n', '>', '>>', {noremap = true, silent = true})
map('n', '<', '<<', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})
map('v', '<', '<gv', {noremap = true, silent = true})

-- Make Y Actually Make Sense
map('n', 'Y', 'yg$', {noremap = true, silent = true})

-- Buffer Navigation
map('n', '<Leader><Tab>', ':bn<CR>', {noremap = true, silent = true})
map('n', '<Leader><S-Tab>', ':bp<CR>', {noremap = true, silent = true})

-- Window Navigation
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Tab Navigation
map('n', '<M-Tab>', ':BufferLineMovePrev<CR>', {noremap = true, silent = true})
map('n', '<M-S-Tab>', ':BufferLineMoveNext<CR>', {noremap = true, silent = true})

-- Ctrl + W Close The Window
-- map('n', '<C-w>', ':bd!<CR>', { noremap = true, silent = true })
-- map('i', '<C-w>', ':bd!<CR>', { noremap = true, silent = true })

-- Telescope && Fuzzy Find
map('n', '<Leader>f.', ':lua require(\'telescope.builtin\').find_files()<CR>',
    {noremap = true, silent = true})
map('n', '<Leader>ff',
    ':lua require(\'pluginSettings.telescope\').search_workspace()<CR>',
    {noremap = true, silent = true})
map('n', '<Leader>fb', ':lua require(\'telescope.builtin\').buffers()<CR>',
    {noremap = true, silent = true})
map('n', '<Leader>fg', ':lua require(\'telescope.builtin\').live_grep()<CR>',
    {noremap = true, silent = true})
map('n', '<Leader>fh', ':lua require(\'telescope.builtin\').help_tags()<CR>',
    {noremap = true, silent = true})

-- LSP
-- lsp finder to find the cursor word definition and reference
map("n", "gh", ':lua require("lspsaga.finder").lsp_finder()<CR>',
    {silent = true, noremap = true})

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
    {noremap = true, silent = true})
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", {silent = true})
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
    {noremap = true, silent = true})
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", {silent = true})
map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>",
    {silent = true, noremap = true})
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",
    {silent = true, noremap = true})
map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>",
    {silent = true, noremap = true})
map('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>',
    {noremap = true, silent = true})
map("n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true})
map('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    {noremap = true, silent = true})
map("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>",
    {silent = true, noremap = true})
map('n', '<Leader>[', "<cmd>Lspsaga diagnostic_jump_prev<CR>",
    {noremap = true, silent = true})
map('n', '<Leader>]', "<cmd>Lspsaga diagnostic_jump_next<CR>",
    {noremap = true, silent = true})

-- UndoTree
map('n', "<Leader>u", ":UndotreeToggle<CR>", {noremap = true})

-- Other
map('n', '<Leader>l', ':noh<CR>', {noremap = true}) -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``j', {noremap = true}) -- Insert a newline and back to normal mode
map('n', '<leader>O', 'm`O<Esc>``k', {noremap = true}) -- Insert a newline and back to normal mode

