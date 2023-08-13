local lspkind = require "lspkind"

lspkind.init()

local  lsp_symbols= {
    Text = " (Text)",
    Method = "󰆧 (Method)",
    Function = "󰊕 (Function)",
    Constructor = " (Constructor)",
    Field = "󰇽 (Field)",
    Variable = "󰂡 (Variable)",
    Class = "󰠱 (Class)",
    Interface = " (Interface)",
    Module = " (Module)",
    Property = "󰜢 (Property)",
    Unit = " (Unit)",
    Value = "󰎠 (Value)",
    Enum = " (Enum)",
    Keyword = "󰌋 (Keyword)",
    Snippet = " (Snippet)",
    Color = "󰏘 (Color)",
    File = "󰈙 (File)",
    Reference = " (Reference)",
    Folder = "󰉋 (Folder)",
    EnumMember = " (EnumMember)",
    Constant = "󰏿 (Constant)",
    Struct = " (Struct)",
    Event = " (Event)",
    Operator = "󰆕 (Operator)",
    TypeParameter = "󰅲 (TypeParameter)",
}
-- Set up nvim-cmp.

vim.opt.completeopt={"menu", "menuone", "noselect"}
local cmp = require'cmp'
cmp.setup({
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    snippet = {
        expand = function (args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            border = 'single',
        }),
        documentation = cmp.config.window.bordered({
            border = 'double'
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    }),

    sources = cmp.config.sources({
        { name = 'vsnip' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    }),


    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[PATH]",
                vsnip = "[Snippet]",
            })[entry.source.name]

            return item
        end,
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})


