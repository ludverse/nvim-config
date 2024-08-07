return {
	{
		"nvim-telescope/telescope.nvim",
		version = "^0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",

		keys = {
			{
				"<Leader>ff",
				function() require("telescope.builtin").find_files() end,
				desc = "Find files"
			},
			{
				"<Leader>fg",
				function() require("telescope.builtin").live_grep() end,
				desc = "Live grep"
			},
			{
				"S",
				function() require("telescope.builtin").buffers() end,
				desc = "Quick buffer search"
			},
			{
				"<Leader>ld",
				function() require("telescope.builtin").diagnostics() end,
				"Search diagnostics",
			},
		},

		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						height = 0.9,
						preview_cutoff = 40,
						prompt_position = "top",
						width = 0.9
					},
					selection_caret = " ",
					entry_prefix = " ",
					multi_icon = "",
					-- preview = false,
					mappings = {
						i = {
							["<Esc>"] = actions.close
						},
					}
				},
				pickers = {
					buffers = {
						ignore_current_buffer = true,
						sort_lastused = true
					},
					diagnostics = {
						sort_by = "severity",
						severity_bound = 0
					}
				}
			})
		end
	},
}
