return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		keys = require("thingy.mappings.harpoon"),

		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()
		end
	},

	{
    "jasonpanosso/harpoon-tabline.nvim",
    dependencies = { "ThePrimeagen/harpoon" },
		opts = {}
}
}
