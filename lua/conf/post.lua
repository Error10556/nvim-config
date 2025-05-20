vim.cmd[[colorscheme melange]]

--local on_attach = function(client, bufnr)
--    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
--    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, bufopts)
--    vim.keymap.set('n', '<leader>=', function() vim.lsp.buf.format { async = true } end, bufopts)
--end
--
--lspconfig = require('lspconfig')
--lspconfig.cpp

require('conf.configlsp')
require('conf.configdap')
