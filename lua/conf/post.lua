require('conf.configlsp')

local ok, _ = pcall(require, 'conf.custom')
if not ok then
    vim.cmd[[colorscheme melange]]
end
