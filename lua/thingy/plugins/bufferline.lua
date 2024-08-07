local function get_harpoon_index(harpoon_list, buf_path)
	for i, item in ipairs(harpoon_list.items) do
		local item_path = vim.fn.fnamemodify(item.value, ":p")
		if item_path == buf_path then
			return i
		end
	end

	return nil
end

local ho = {
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"folke/tokyonight.nvim",
			"ThePrimagen/harpoon",
		},

		opts = {
			options = {
				separator_style = { "█", "█" },
				indicator = {
					style = "none"
				},
				show_buffer_close_icons = false,
				tab_size = 0,
				sort_by = function(buf_a, buf_b)
					local harpoon_list = require("harpoon"):list()

					local index_a = get_harpoon_index(harpoon_list, buf_a.path)
					local index_b = get_harpoon_index(harpoon_list, buf_b.path)

					return index_b > index_a
				end,
				custom_filter = function(bufn)
					local harpoon_list = require("harpoon"):list()

					local buf_name = vim.fn.bufname(bufn)
					local buf_path = vim.fn.fnamemodify(buf_name, ":p")

					if get_harpoon_index(harpoon_list, buf_path) ~= nil then
						return true
					else
						return false
					end
				end
			},
			highlights = {
				buffer_selected = { bold = false, italic = false },
				hint_selected = { bold = false, italic = false },
				hint_diagnostic_selected = { bold = false, italic = false },
				info_selected = { bold = false, italic = false },
				info_diagnostic_selected = { bold = false, italic = false },
				warning_selected = { bold = false, italic = false },
				warning_diagnostic_selected = { bold = false, italic = false },
				error_selected = { bold = false, italic = false },
				error_diagnostic_selected = { bold = false, italic = false },
			}
		}
	}
}
return {}
