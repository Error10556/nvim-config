vim.keymap.set('n', "<leader>pb", function() require("dap").list_breakpoints() end)
vim.keymap.set('n', "<leader>ps", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes, { border = "rounded" })
            end)
vim.keymap.set('n', "<F1>", function() require("dap.ui.widgets").hover(nil, { border = "rounded" }) end)
-- vim.keymap.set('n', "<F4>", "<CMD>DapDisconnect<CR>")
vim.keymap.set('n', "<F5>", "<CMD>DapContinue<CR>")
vim.keymap.set('n', "<F6>", function() require("dap").run_to_cursor() end)
vim.keymap.set('n', "<F7>", "<CMD>DapTerminate<CR>")
vim.keymap.set('n', "<F9>", "<CMD>DapToggleBreakpoint<CR>")
vim.keymap.set('n',
            "<leader><F9>",
            function()
                vim.ui.input(
                    { prompt = "Breakpoint condition: " },
                    function(input) require("dap").set_breakpoint(input) end
                )
            end)
vim.keymap.set('n', "<F10>", "<CMD>DapStepOver<CR>")
vim.keymap.set('n', "<F11>", "<CMD>DapStepInto<CR>")
vim.keymap.set('n', "<F12>", "<CMD>DapStepOut<CR>" )
