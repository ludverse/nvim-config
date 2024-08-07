local maploader = require("thingy.maploader")
local lsp_mappings = require("thingy.mappings.lsp")

maploader.preload_mappings("lsp", lsp_mappings)

-- Loads lsp mappings when lsp is attached to buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(e)
		maploader.set_mappings(lsp_mappings, e.buf)
	end
})
