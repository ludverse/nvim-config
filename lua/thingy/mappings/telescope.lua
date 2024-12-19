return {
	{ "<Leader>f",  "<Nop>",                                                   desc = "Find" },
	{ "<Leader>ff", function() require("telescope.builtin").find_files() end,  desc = "Find files" },
	{ "<Leader>fg", function() require("telescope.builtin").live_grep() end,   desc = "Live grep" },
	{ "S",          function() require("telescope.builtin").buffers() end,     desc = "Quick buffer search" },
	{ "<Leader>ld", function() require("telescope.builtin").diagnostics() end, "Search diagnostics" },
}
