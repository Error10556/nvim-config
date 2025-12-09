return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {"neovim/nvim-lspconfig"},
            {
                "mason-org/mason.nvim",
                config = true
            },
        },
        opts = {
            ensure_installed = {
                "clangd", "basedpyright"
            }
        }
    },
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-buffer"},
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" }
    },
    {"saadparwaiz1/cmp_luasnip"},
    {"hrsh7th/cmp-nvim-lsp"},
}
