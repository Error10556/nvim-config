vim.api.nvim_create_user_command(
    "Vscode",
    "!cp -r ~/.config/nvim/cpp.vscode ./.vscode",
    {
        desc = "Copy the default configuration to the current directory."
    }
)
