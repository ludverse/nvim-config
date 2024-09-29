return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			automatic_installation = true
		}
	},
}
