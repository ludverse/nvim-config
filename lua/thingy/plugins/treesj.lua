return {
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = true,
		event = "BufEnter",

		keys = require("thingy.mappings.treesj"),

		opts = {
			max_join_length = 250000,
			use_default_keymaps = false
		},
	}
}
