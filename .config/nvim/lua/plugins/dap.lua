-- Dap on the bugs
return {
  'mfussenegger/nvim-dap',
  lazy=true,
  keys={
    {"<F1>", ":lua require('dap').step_into()<CR>", desc="Step Into"},
    {"<F2>", ":lua require('dap').step_over()<CR>", desc="Step Over"},
    {"<F3>", ":lua require('dap').step_out()<CR>", desc="Step Out"},
    {"<F4>", ":lua require('dap').continue()<CR>", desc="Continue"},
    {"<F5>", ":lua require('dapui').toggle()<CR>", desc="Toggle Dap UI"},
    {"<leader>b", ":lua require('dap').toggle_breakpoint()<CR>", desc="Toggle Breakpoint"},
    {"<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc="Set Breakpoint Condition"},
    {"<leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"},
    {"<leader>dr", ":lua require('dap').repl.open()<CR>", desc="Open Dap Repl"},
    -- {"<leader>dt", pydap.debug_test} -- not working

  },
  dependencies = {
    {'rcarriga/nvim-dap-ui'}, {'mfussenegger/nvim-dap-python'},
    {'theHamsta/nvim-dap-virtual-text'},
    {'nvim-telescope/telescope-dap.nvim'}
  },
  config=function()
    require("nvim-dap-virtual-text").setup()
    require('dap-python').setup('~/.local/share/debugpy/bin/python')

    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end
}
