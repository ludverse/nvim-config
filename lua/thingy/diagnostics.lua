vim.diagnostic.config({
	severity_sort = true, -- show errors before warnings
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for name, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	-- use vim.diagnostics.config insteaf
end
