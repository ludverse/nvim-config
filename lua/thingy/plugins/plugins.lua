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
			require("tokyonight").setup({
				transparent = true,
			});

			vim.cmd("colorscheme tokyonight")
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

	{
	    -- for neovim lua lsp types
	    "folke/lazydev.nvim",
	    ft = "lua",
		version = "^1.8.0",
	    opts = {}
	},

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
