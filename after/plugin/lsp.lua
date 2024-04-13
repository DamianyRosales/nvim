-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function()
    -- definitions and types
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set("n", "<leader>rd", vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {buffer = 0})
    -- diagnostics
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", {buffer = 0})
    -- code actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_actions, {buffer = 0})
end

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.lua_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim"
                }
            }
        }
    }
}

require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer",
    }
}
