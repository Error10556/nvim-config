return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "html", "xml", "cpp", "desktop", "bash", "python", "sql", "regex", "json", "gitignore", "asm" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}}
