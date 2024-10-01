-- Signs
for _, group in pairs({
    "DapBreakpoint",
    "DapBreakpointCondition",
    "DapBreakpointRejected",
    "DapLogPoint",
}) do vim.fn.sign_define(group, { text = "●", texthl = group })
end

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
dap.adapters.python = function(cb, config)
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
dap.adapters.debugpy = dap.adapters.python
