return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require'nvim-treesitter'.install{ "c", "lua", "vim", "vimdoc", "html",
        "xml", "cpp", "desktop", "bash", "python", "sql", "regex", "json",
        "gitignore", "asm" }
    end,
}}
