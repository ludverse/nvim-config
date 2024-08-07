return {
	{
		"folke/flash.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					enabled = false,
				},
			},
		},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		},

	},
}
