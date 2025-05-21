vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 1000
vim.opt.colorcolumn = "80"

vim.g.mapleader = ' '
vim.keymap.set("n", "E", vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

vim.keymap.set('n', '<leader>o', 'O<CR>')

vim.keymap.set('n', '<leader>{', 'A{<CR>}<Esc>O')
vim.keymap.set('n', '<leader>[', 'A[<CR>]<Esc>O')

vim.keymap.set('n', '<leader>c', 'iconst <Esc>f i&<Esc>')
vim.keymap.set('n', '<leader>a', 'ggVG"+y')

vim.api.nvim_create_user_command('Theme', function()
    if vim.opt.background._value == 'light' then
        vim.opt.background = 'dark'
    else
        vim.opt.background = 'light'
    end
end, { desc = 'Switch light/dark theme' } )
