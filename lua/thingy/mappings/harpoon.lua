return {
	{ "<Leader>h",  "<Nop>",                                            desc = "Harpoon" },
	{
		"<Leader>hh",
		function()
			local harpoon_list = require("harpoon"):list()
			local conf = require("telescope.config").values

			local file_paths = {}
			for _, item in ipairs(harpoon_list.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end,
		desc = "Harpoon quick menu"
	},

	{ "<Leader>ha", function() require("harpoon"):list():add() end,     desc = "Add buffer to harpoon" },
	{ "<Leader>hr", function() require("harpoon"):list():remove() end,  desc = "Add buffer to harpoon" },

	{ "<C-j>",      function() require("harpoon"):list():select(1) end, desc = "Select harpoon 1" },
	{ "<C-k>",      function() require("harpoon"):list():select(2) end, desc = "Select harpoon 2" },
	{ "<C-l>",      function() require("harpoon"):list():select(3) end, desc = "Select harpoon 3" },
	{ "<C-;>",      function() require("harpoon"):list():select(4) end, desc = "Select harpoon 4" },
}
