local M = {}

M.preload_mappings = function(category_name, mappings)
	for _, mapping in pairs(mappings) do
		local mode = "n"
		local opts = {
			callback = function()
				vim.notify("[maploader]: mappings for `" ..
					category_name .. "` has not yet been loaded or not available in this buffer")
			end
		}

		if mapping.desc then
			opts.desc = mapping.desc
		end

		vim.api.nvim_set_keymap(mode, mapping[1], "<Nop>", opts)
	end
end

M.set_mappings = function(mappings, use_buffer_n)
	for _, mapping in ipairs(mappings) do
		local mode = "n"
		local opts = {
			silent = true
		}

		local lhs = mapping[1]
		local rhs = mapping[2]

		if type(mapping[2]) == "function" then
			opts.callback = mapping[2]
			rhs = "<Nop>"
		end

		for k, val in pairs(mapping) do
			if type(k) ~= "number" then
				if k == "mode" then
					mode = val
				else
					opts[k] = val
				end
			end
		end

		if use_buffer_n ~= nil then
			vim.api.nvim_buf_set_keymap(use_buffer_n, mode, lhs, rhs, opts)
		else
			vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
		end
	end
end

return M
