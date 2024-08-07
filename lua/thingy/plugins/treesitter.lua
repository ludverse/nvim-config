return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "BufEnter",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"rust",
					"zig",
					"go",
					"gleam",
					"lua",
					"typescript",
					"javascript",
					"html",
					"css",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },

		config = function()
			require "nvim-treesitter.configs".setup {
				textobjects = {
					select = {
						enable = true,
						lookahead = true,

						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					}
				}
			}
		end
	},

	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = true,
		event = "BufEnter",

		keys = require("thingy.mappings.treesitter"),

		opts = {
			use_default_keymaps = false
		},
	}
}
