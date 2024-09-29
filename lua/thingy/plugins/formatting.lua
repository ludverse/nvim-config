return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		-- todo add lsps.lua options into format EDIT sept 2024 what does this mean?
		opts = {},
		keys = {
			{

				"<Leader>tf",
				function()
					require("conform").format({
						timeout_ms = 500,
						lsp_format = "fallback",
					})
				end,
				desc = "Format code"
			}
		}
	}
}
