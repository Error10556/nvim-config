local dapconfig = function()
    -- Signs
    vim.fn.sign_define('DapBreakpoint', { text = "●", texthl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text = "󰮕", texthl = 'DapBreakpointCondition' })
    vim.fn.sign_define('DapBreakpointRejected', { text = "󰮈", texthl = 'DapBreakpointRejected' })
    vim.fn.sign_define('DapLogPoint', { text = "󰮆", texthl = 'DapLogPoint' })


    local dap = require("dap")

    -- Setup

    -- Decides when and how to jump when stopping at a breakpoint
    -- The order matters!
    --
    -- (1) If the line with the breakpoint is visible, don't jump at all
    -- (2) If the buffer is opened in a tab, jump to it instead
    -- (3) Else, create a new tab with the buffer
    --
    -- This avoid unnecessary jumps
    dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"

    -- Adapters
    -- C, C++, Rust
    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
        },
    }
    -- Python
    dap.adapters.debugpy = function(cb, config)
        if config.request == "attach" then
            ---@diagnostic disable-next-line: undefined-field
            local port = (config.connect or config).port
            ---@diagnostic disable-next-line: undefined-field
            local host = (config.connect or config).host or "localhost"
            cb({
                type = "server",
                port = assert(
                    port,
                    "`connect.port` is required for a python `attach` configuration"
                ),
                host = host,
            })
        else
            cb({
                type = "executable",
                command = "debugpy-adapter",
            })
        end
    end
    -- The python adapter is deprecated, see nvim-dap-python#129
    dap.adapters.python = dap.adapters.debugpy
end

return {
    {
        'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup({
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
            })
            vim.keymap.set('n', '<leader>d', function() require('dapui').toggle() end)
            vim.keymap.set('n', "<leader>ps", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes, { border = "rounded" })
            end)
            vim.keymap.set('n', "<F1>", function() require("dap.ui.widgets").hover(nil, { border = "rounded" }) end)
            vim.keymap.set('n', "<F5>", "<CMD>DapContinue<CR>")
            vim.keymap.set('n', "<F6>", function() require("dap").run_to_cursor() end)
            vim.keymap.set('n', "<F7>", "<CMD>DapTerminate<CR>")
            vim.keymap.set('n', "<F9>", "<CMD>DapToggleBreakpoint<CR>")
            vim.keymap.set('n',
                "<F21>",
                function()
                    vim.ui.input(
                        { prompt = "Breakpoint condition: " },
                        function(input) require("dap").set_breakpoint(input) end
                    )
                end)
            vim.keymap.set('n', "<F10>", "<CMD>DapStepOver<CR>")
            vim.keymap.set('n', "<F11>", "<CMD>DapStepInto<CR>")
            vim.keymap.set('n', "<F12>", "<CMD>DapStepOut<CR>" )
        end,
        dependencies = {
            {
                'mfussenegger/nvim-dap',
                config = dapconfig
            },
            {
                'mfussenegger/nvim-dap-python',
                config = function()
                    require('dap-python').setup('python')
                end
            },
            'nvim-neotest/nvim-nio',
        }
    },
    {
        'stevearc/overseer.nvim',
        config = function()
            require('overseer').setup()
            vim.keymap.set('n', '<leader>t', '<Cmd>OverseerToggle<Cr>')
            vim.keymap.set('n', '<leader>r', '<Cmd>OverseerRun<Cr>')
        end,
        lazy = false,
    }
}
