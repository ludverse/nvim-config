return {
	{ "<Leader>n", ":enew<Enter>",                           desc = "New empty buffer" },
	{ "<Leader>w", ":bd<Enter>",                             desc = "Close buffer" },

	{ "gl",        vim.diagnostic.open_float,                desc = "Hover diagnostics" },

	{ "gl",        function() require("cmp").complete() end, mode = "x" },
}
