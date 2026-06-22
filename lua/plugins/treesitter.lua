return {{
    "romus204/tree-sitter-manager.nvim",
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    config = function()
        require("tree-sitter-manager").setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "html", "xml", "cpp", "desktop",
                "bash", "python", "sql", "regex", "json", "gitignore", "asm",
                "typst", "haskell"
            },
            auto_install = true,
            languages = { haskell = {
                install_info = {
                    revision = "98aedbd2d6947a168ba3ba3755d70b0cb6b78395",
                    url = "https://github.com/tree-sitter-grammars/" ..
                        "tree-sitter-haskell",
                }},
            },
        })
    end,
}}
