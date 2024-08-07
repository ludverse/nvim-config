return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		version = "^2.2.0"
	},

	{
		"hrsh7th/nvim-cmp",
		commit = "a110e12",
		event = "LspAttach",
		dependencies = {
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"sar/cmp-lsp.nvim"
		},

		config = function()
			require("thingy.nvim-cmp")
		end
	},

	{
		"stevearc/conform.nvim",
		event = "LspAttach",
		-- todo add lsps.lua options into format
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
