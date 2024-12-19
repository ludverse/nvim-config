return {
	{ "<C-n>", function() require("cmp").select_next_item() end, mode = "i" },
	{ "<C-p>", function() require("cmp").select_prev_item() end, mode = "i" },
	{ "<C-y>", function() require("cmp").confirm() end,          mode = "i" },
}
