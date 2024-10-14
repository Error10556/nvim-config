local ovs = require('overseer')
ovs.setup()
vim.keymap.set('n', '<leader>t', "<Cmd>OverseerToggle<CR>")
vim.keymap.set('n', '<leader>r', "<Cmd>OverseerRun<CR>")
