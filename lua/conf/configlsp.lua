require('mason').setup()
require('mason-lspconfig').setup()
vim.lsp.config('gopls', {
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

-- keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
        end
        bufmap('n', 'K', vim.lsp.buf.hover)
        bufmap('n', 'gd', vim.lsp.buf.definition)
        bufmap('n', 'gD', vim.lsp.buf.declaration)
        bufmap('n', 'gi', vim.lsp.buf.implementation)
        bufmap('n', 'go', vim.lsp.buf.type_definition)
        bufmap('n', 'gr', vim.lsp.buf.references)
        bufmap('n', 'gs', vim.lsp.buf.signature_help)
        bufmap('n', '<F2>', vim.lsp.buf.rename)
        bufmap('n', '<F4>', vim.lsp.buf.code_action)
        bufmap('n', 'gl', vim.diagnostic.open_float)
        bufmap('n', '[d', vim.diagnostic.goto_prev)
        bufmap('n', ']d', vim.diagnostic.goto_next)
        bufmap('n', '<leader>=', vim.lsp.buf.format)
    end
})

-- snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- autocompletion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer',   keyword_length = 2 },
        { name = 'luasnip',  keyword_length = 2 },
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local map = {
                nvim_lsp = '󰅏',
                luasnip = '󰋣',
                buffer = '󰆏',
            }
            item.menu = map[entry.source.name]
            return item
        end
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<C-l>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-k>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-Space>'] = cmp.mapping(function(_)
            cmp.complete()
        end, { 'i', 's' }),
    }
})

-- diagnostics
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰚌',
            [vim.diagnostic.severity.WARN] = '󰖷',
            [vim.diagnostic.severity.INFO] = '󰛐',
            [vim.diagnostic.severity.HINT] = '󰑽',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
    severity_sort = true,
})
