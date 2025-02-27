vim.api.nvim_create_user_command(
    "Vscode",
    "!cp -r ~/.config/nvim/cpp.vscode ./.vscode",
    {
        desc = "Copy the default C++ configuration to the current directory."
    }
)
vim.api.nvim_create_user_command(
    "VscodeC",
    "!cp -r ~/.config/nvim/c.vscode ./.vscode",
    {
        desc = "Copy the default C configuration to the current directory."
    }
)
vim.api.nvim_create_user_command(
    "Clangfmt",
    "!cp ~/.config/nvim/clangfmt/.clang-format .",
    {
        desc = "Copy the default formatter configuration into the current directory."
    }
)
