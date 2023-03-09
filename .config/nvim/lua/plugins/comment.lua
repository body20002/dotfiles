return {
  'numToStr/Comment.nvim',
  config=true,
  lazy=true,
  keys={
    {'<C-_>', ":lua require('Comment.api').toggle.linewise.current()<CR>", {noremap = true, silent = true}, desc="", mode='n'},
    {'<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', {noremap = true, silent = true}, desc="", mode='x'},
    {'<C-_>', ":lua require('Comment.api').toggle.linewise.current() <CR>", {noremap = true, silent = true}, desc="", mode='i'},
  },
}
