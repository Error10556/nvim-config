return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {"<leader>ff", "<Cmd>Telescope find_files<Cr>"},
            {"<leader>rg", "<Cmd>Telescope live_grep<Cr>"},
            {"<leader>fg", "<Cmd>Telescope git_files<Cr>"},
        }
    }
}
