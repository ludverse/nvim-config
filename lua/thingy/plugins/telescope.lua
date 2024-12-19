return {
	{
		"nvim-telescope/telescope.nvim",
		version = "^0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",

		keys = require("thingy.mappings.telescope"),

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
