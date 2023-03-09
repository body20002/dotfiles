return {
  'ms-jpq/coq_nvim',
  branch = "coq",
  build = ":COQdeps",
  lazy = true,
  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      xdg = true,
      match = {max_results = 100},
      keymap = {jump_to_mark = "<c-cr>"},
      display = {icons = {mode = 'long'}, preview = {resolve_timeout = 5}},
      clients = {third_party = {enabled = true}},
      limits = {
        completion_auto_timeout = 2,
        completion_manual_timeout = 5
      }
    }
  end,
  dependencies = {
    {'ms-jpq/coq.artifacts', branch = "artifacts"},
    {
      'ms-jpq/coq.thirdparty',
      branch = "3p",
      config = function()
        require("coq_3p") {
          {src = "cow", trigger = "!cow"},
          {src = "nvimlua", short_name = "NVIM", conf_only = true}
          -- { src = "dap" }
        }
      end
    },
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  }
}
