-- get capabilities for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities

-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    --capabilities = capabilities
})
lspconfig.rust_analyzer.setup({
    -- capabilities = capabilities,
    -- settings = {
        -- ["rust-analyzer"] = {},
    -- },
})

lspconfig.tsserver.setup({
    --capabilities = capabilities
})

