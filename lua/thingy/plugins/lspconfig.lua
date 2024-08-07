return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig",
			"sar/cmp-lsp.nvim",
		},
		version = "^0.1.8",
		config = function() require("thingy.lspconfig") end,
	}
}
