return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require'nvim-treesitter'.install{ "c", "lua", "vim", "vimdoc", "html",
        "xml", "cpp", "desktop", "bash", "python", "sql", "regex", "json",
        "gitignore", "asm", "typst" }
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'python', 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'python',
                'go', 'gomod', 'gowork', 'gotmpl', 'haskell', 'lua', 'typst'
            },
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldmethod = 'expr'
                vim.wo[0][0].foldlevel = 99
            end
        })
    end,
}}
