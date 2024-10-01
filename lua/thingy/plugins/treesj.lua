return {
	{
		"Wansmer/treesj",
		event = "BufEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },

		keys = require("thingy.mappings.treesj"),

		opts = {
			max_join_length = 250000,
			use_default_keymaps = false
		},
	}
}
