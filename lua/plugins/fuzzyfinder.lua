return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {"<leader>ff", "<Cmd>Telescope find_files<Cr>"},
            {"<leader>fg", "<Cmd>Telescope git_files<Cr>"},
        },
        cmd = {'RG'},
        config = function()
            vim.api.nvim_create_user_command('RG', 'Telescope live_grep', {})
        end
    }
}
