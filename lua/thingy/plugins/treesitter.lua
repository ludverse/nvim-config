return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
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
					"hurl",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "BufEnter",
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
							["al"] = "@assignment.lhs",
							["il"] = "@assignment.lhs",
							["ar"] = "@assignment.rhs",
							["ir"] = "@assignment.rhs",
						},

						selection_modes = {
							["@function.outer"] = "V",
							["@function.inner"] = "V",
							["@conditional.outer"] = "V",
							["@conditional.inner"] = "V",

							["@parameter.outer"] = "v",
							["@parameter.inner"] = "v",
							["@assignment.lhs"] = "v",
							["@assignment.rhs"] = "v",
						},
					}
				}
			}
		end
	},
}
