return {
	{
		"numToStr/Comment.nvim",
		version = "^0.8.0",
		event = "BufEnter",

		keys = {
			{
				"Hc",
				function()
					local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
					vim.api.nvim_feedkeys(esc, "nx", false)

					require("Comment.api").toggle.linewise(vim.fn.visualmode())
				end,
				mode = "x",
				desc = "Toggle linewise comment"
			},
			{
				"Hb",
				function()
					local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
					vim.api.nvim_feedkeys(esc, "nx", false)

					require("Comment.api").toggle.blockwise(vim.fn.visualmode())
				end,
				mode = "x",
				desc = "Toggle blockwise comment"
			},
		},

		opts = {
			mappings = false
		}
	}
}
