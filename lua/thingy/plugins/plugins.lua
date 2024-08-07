return {
	{
		"folke/which-key.nvim",
		version = "^2.1.0",
		opts = {},
	},

	{
		"folke/tokyonight.nvim",
		version = "^4.4.0",
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},

	{
		-- nice vim.input and vim.select boxes
		"stevearc/dressing.nvim",
		commit = "6741f10",
	},

	{
	},

	-- { "sigmaSd/deno-nvim", lazy = true }, remove?

	-- {
	--     -- for neovim lua lsp types
	--     "folke/lazydev.nvim",
	--     ft = "lua",
	--     opts = {}
	-- },

	{
		"windwp/nvim-autopairs",
		commit = "78a4507",
		event = "InsertEnter",
		opts = {},
	},

	{
		"kylechui/nvim-surround",
		version = "^2.3.0",
		event = "BufEnter",
		opts = {
		},
		init = function()

		end
	}
}
