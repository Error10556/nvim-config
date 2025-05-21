return {
    {"neovim/nvim-lspconfig"},
    {"mason-org/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
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
