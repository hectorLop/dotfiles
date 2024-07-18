local lsp = require("lsp-zero")

-- Info here: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/autocomplete.md

lsp.preset("recommended")

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
    'pyright',
    'zls',
    'hls',
    'elixirls',
    'jsonls'
})

require('lspconfig').elixirls.setup({
    cmd = { "/Users/hectorlopez/.config/elixir/elixir-ls/language_server.sh" },
    settings = {
        dialyzerEnabled = false,
        fetchDeps = false,
        enableTestLenses = false,
        suggestSpecs = false,
    },
})

require('lspconfig').jsonls.setup {}

require('lspconfig').zls.setup({
    settings = {
        zls = {
            enable_autofix = false, -- Disable autofix
        }
    }
})

require('lspconfig').rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                features = "all"
            },
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
            },
        }
    }
})

require('lspconfig').hls.setup({})
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'
--vim.g.zig_fmt_autosave = 0

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete()
    }
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.diagnostic.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.diagnostic.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.diagnostic.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

vim.diagnostic.config({
    virtual_text = true
})

lsp.setup()

-- black setup
require("mason-null-ls").setup({
    ensure_installed = { "black" }
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
    },
})
