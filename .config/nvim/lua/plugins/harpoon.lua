-- -- harpoon
-- local harpoon = vim.api.nvim_create_augroup("harpoon", {})
-- vim.api.nvim_create_autocmd("BufEnter",
--         {pattern="*", callback=function() require("harpoon.mark").add_file() end, group=harpoon
-- })

return {
  'ThePrimeagen/harpoon',
  lazy=true,
  keys={
    {'<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>', desc="Add File"},
    {'<Leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc="Toggle Quick Menu"},
    {'<M-Tab>', ':lua require("harpoon.ui").nav_next() <CR>', {noremap = true, silent = true}, desc="Next Harpooned File"},
    {'<M-S-Tab>', ':lua require("harpoon.ui").nav_prev() <CR>', {noremap = true, silent = true}, desc="Previous Harpooned File"},
  },
  opts = {
    excluded_filetypes = { "harpoon" }
  }
}
