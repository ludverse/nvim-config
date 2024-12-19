return {
	{
		"numToStr/Comment.nvim",
		version = "^0.8.0",
		event = "BufEnter",

		opts = {
			mappings = {
				extra = false
			}
		}
	},
	{
		"Djancyp/better-comments.nvim",
		event = "BufEnter",

		opts ={
			tags = {
				{
					name = "TODO",
					fg = "white",
					bg = "#0a7aca",
					bold = true,
				},
				{
					name = "FIX",
					fg = "white",
					bg = "#f44747",
					bold = true,
				},
				{
					name = "WARN",
					fg = "#FFA500",
					bg = "",
					bold = false,
				},
				{
					name = "!",
					fg = "#fc5c65",
					bg = "",
					bold = true,
				}

			}
		},
		config = function(opts)
			require("better-comment").Setup(opts) -- TODO hunt better-comments' maintainer down and haunt him for this function with A CAPTAL S ARE YOU OUT OF YOUR MIND
		end
	}
}
