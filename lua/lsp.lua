-- get capabilities for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    capabilities = capabilities
})

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    -- settings = {
        -- ["rust-analyzer"] = {},
    -- },
})

lspconfig.tsserver.setup({
    --capabilities = capabilities
})

vim.diagnostic.config({
    severity_sort = true
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for name, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
