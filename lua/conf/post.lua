require('conf.configlsp')

vim.cmd([[highlight TrailingWhitespace ctermbg=red guibg=red]]);
vim.api.nvim_create_autocmd({'ColorScheme'}, {
    pattern = '*',
    command = [[highlight TrailingWhitespace ctermbg=red guibg=red]]
});
vim.api.nvim_create_autocmd({'BufNew'}, {
    pattern = '*',
    callback = function(ev)
        vim.fn.matchadd("TrailingWhitespace", [[\s\+$]])
    end
});
vim.fn.matchadd("TrailingWhitespace", [[\s\+$]]);
local ok, _ = pcall(require, 'conf.custom')
if not ok then
    vim.cmd[[colorscheme melange]]
end
