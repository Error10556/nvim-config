vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--vim.keymap.set('n', '<leader>d', '"_d')
--vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('n', '<leader>=', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

vim.keymap.set('n', '<leader>o', 'O<CR>')

vim.keymap.set('n', '<leader>{', 'A{<CR>}<Esc>O')
vim.keymap.set('n', '<leader>[', 'A[<CR>]<Esc>O')

vim.keymap.set('n', '<leader>c', 'iconst <Esc>f i&<Esc>')
vim.keymap.set('n', '<leader>a', 'ggVG"+y')
