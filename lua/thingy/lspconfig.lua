local lsps = require("thingy.configs.lsps")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.dynamicRegistration = true

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
