return {
	{ "<Leader>l",  "<Nop>",                     desc = "LSP" },
	{ "gD",         vim.lsp.buf.declaration,     "Go declaration" },
	{ "gd",         vim.lsp.buf.definition,      "Go definition" },
	{ "K",          vim.lsp.buf.hover,           "Symbol hover menu" },
	{ "gi",         vim.lsp.buf.implementation,  "Go implementation" },
	{ "gy",         vim.lsp.buf.type_definition, "Go type definition" },
	{ "gr",         vim.lsp.buf.references,      "Go references" },
	{ "<Leader>lh", vim.lsp.buf.signature_help,  "Signature help" },
	{ "<Leader>lr", vim.lsp.buf.rename,          "Rename symbol" },
	{ "<Leader>la", vim.lsp.buf.code_action,     "Code actions" },

	{ "<Leader>la", vim.lsp.buf.code_action,     "Code actions",      mode = "x" },
}
