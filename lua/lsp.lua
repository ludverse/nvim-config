local lsps = require("lsps")

-- get capabilities for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- Setup language servers.
local lspconfig = require("lspconfig")

for name, opts in pairs(lsps) do
    local config = {
        capabilities = capabilities
    }

    for k, val in pairs(opts) do
         config[k] = val
    end

    lspconfig[name].setup(config)
end

vim.diagnostic.config({
    severity_sort = true
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for name, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
