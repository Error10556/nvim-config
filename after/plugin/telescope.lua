local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', function()
        local str = vim.fn.input('Grep: ')
        builtin.grep_string({ search = str })
end)
