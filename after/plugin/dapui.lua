require("dapui").setup()
vim.keymap.set('n', '<leader>d', function() require('dapui').toggle() end)

local dap_up_config = {
  icons = { expanded = "🞃", collapsed = "🞂", current_frame = "→" },
  controls = {
    icons = {
      pause = "⏸",
      play = "⯈",
      step_into = "↴",
      step_over = "↷",
      step_out = "↑",
      step_back = "↶",
      run_last = "🗘",
      terminate = "🕱",
      disconnect = "⏻"
    }
  }
}

require("dapui").setup(dap_up_config)

