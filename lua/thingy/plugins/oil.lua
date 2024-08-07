return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },

		keys = {
			{
				"<Leader>e",
				function() require("oil").open_float() end,
				desc = "Oil explore"
			}
		},

		opts = {
			-- default_file_explorer = false,
			float = {
				padding = 4,
			}
		},

		setup = function()
			-- https://www.reddit.com/r/neovim/comments/yckqsn/how_to_disable_netrw_in_favor_of_own_plugin/
			-- disable netrw
			vim.g.loaded_netrwPlugin = 1
		end
	}
}
