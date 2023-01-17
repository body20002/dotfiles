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
map("n", "<F7>", "<Esc>V:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>:noh<CR>", {})
map("v", "<F7>", "<Esc>V:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>:noh<CR>", {})
map("i", "<F7>", "<Esc>V:s/\\v<(.)(\\w*)/\\u\\1\\L\\2/g<CR>:noh<CR>i", {})

-- The Best Thing In vscode But Better
map('v', "J", ":m '>+1<CR>gv=gv")
map('v', "K", ":m '<-2<CR>gv=gv")

-- Replace The Current Word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--The BEST MAP
map('x', "<Leader>p", "\"_dP")

-- STOP USING THE ARROW KEYS !!
-- map('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
-- map('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
-- map('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
-- map('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})

-- Comments
map('n', '<C-_>', ":lua require('Comment.api').toggle.linewise.current()<CR>",
{noremap = true, silent = true})
map('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
{noremap = true, silent = true})
map('i', '<C-_>',
":lua require('Comment.api').toggle.linewise.current() <CR>",
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
map('n', '<M-Tab>', ':lua require("harpoon.ui").nav_next() <CR>', {noremap = true, silent = true})
map('n', '<M-S-Tab>', ':lua require("harpoon.ui").nav_prev() <CR>', {noremap = true, silent = true})

-- Ctrl + W Close The Window
-- map('n', '<C-w>', ':bd!<CR>', { noremap = true, silent = true })
-- map('i', '<C-w>', ':bd!<CR>', { noremap = true, silent = true })

-- Telescope && Fuzzy Find
local tele = require('telescope.builtin')
map('n', '<Leader>ff',
tele.find_files,
{noremap = true, silent = true})
map('n', '<Leader>fb', tele.buffers,
{noremap = true, silent = true})
map('n', '<Leader>fg', tele.live_grep,
{noremap = true, silent = true})
map('n', '<Leader>fh', tele.help_tags,
{noremap = true, silent = true})
map('n', '<Leader>fs', tele.spell_suggest,
{noremap = true, silent = true})
map('n', '<Leader>fk', tele.keymaps,
{noremap = true, silent = true})
map('n', '<Leader>fvo', tele.vim_options,
{noremap = true, silent = true})
map('n', '<Leader>fd', tele.diagnostics,
{noremap = true, silent = true})
map('n', '<Leader>fcs', tele.git_status,
{noremap = true, silent = true})

-- LSP
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>",
{silent = true, noremap = true})

map('n', 'gD', ":lua vim.lsp.buf.declaration()<CR>",
{noremap = true, silent = true})
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {silent = true})
map('n', 'gi', ":lua vim.lsp.buf.implementation()<CR>",
{noremap = true, silent = true})
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", {silent = true})
map("n", "<leader>k", ":lua vim.lsp.buf.signature_help()<CR>",
{silent = true, noremap = true})
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",
{silent = true, noremap = true})
map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>",
{silent = true, noremap = true})
map('n', '<Leader>gr', ":lua vim.lsp.buf.references()<CR>",
{noremap = true, silent = true})
map("n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true})
map('n', '<Leader>D', ":lua vim.lsp.buf.type_definition()<CR>",
{noremap = true, silent = true})
map("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>",
{silent = true, noremap = true})
map('n', '<Leader>[', "<cmd>Lspsaga diagnostic_jump_prev<CR>",
{noremap = true, silent = true})
map('n', '<Leader>]', "<cmd>Lspsaga diagnostic_jump_next<CR>",
{noremap = true, silent = true})
map("n", "<Leader>T", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
map("t", "<Leader>T", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- UndoTree
map('n', "<Leader>u", ":UndotreeToggle<CR>", {noremap = true})

-- Format
map('n', "<Leader>F", ":FormatWrite<CR>", {noremap = true})

-- Other
map('n', '<Leader>l', ':noh<CR>', {noremap = true}) -- Clear highlights
map('n', '<leader>o', ":pu =''<CR>", {noremap = true}) -- Insert a newline and back to normal mode
map('n', '<leader>O', ":pu! =''<CR>", {noremap = true}) -- Insert a newline and back to normal mode

-- harpoon
map('n', '<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<Leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

-- debugging
map("n", "<F1>", ":lua require('dap').step_into()<CR>")
map("n", "<F2>", ":lua require('dap').step_over()<CR>")
map("n", "<F3>", ":lua require('dap').step_out()<CR>")
map("n", "<F4>", ":lua require('dap').continue()<CR>")
map("n", "<F5>", ":lua require('dapui').toggle()<CR>")
map("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
map("n", "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<leader>dr", ":lua require('dap').repl.open()<CR>")
-- map("n", "<leader>dt", pydap.debug_test) -- not working
