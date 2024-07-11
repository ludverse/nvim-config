local mappings = require("mappings")

local M = {}

M.preload_mappings = function(sub, sub_mappings)
    for mode, mode_mappings in pairs(sub_mappings) do
        for key, mapping in pairs(mode_mappings) do
            local opts = {
                callback = function()
                    vim.notify("[maploader]: mappings for `" .. sub .. "` has not yet been loaded or not available in this buffer")
                end
            }

            if mapping[2] then
                opts.desc = mapping[2]
            end

            vim.api.nvim_set_keymap(mode, key, "<Nop>", opts)
        end
    end
end

M.set_mappings = function(sub_mappings, use_buffer_n)
    for mode, mode_mappings in pairs(sub_mappings) do
        for key, mapping in pairs(mode_mappings) do
            local opts = {
                silent = true
            }
            local rhs = mapping[1]
            if type(mapping[1]) == "function" then
                opts.callback = mapping[1]
                rhs = "<Nop>"
            end

            if mapping[2] then
                opts.desc = mapping[2]

                if mapping[3] then
                    for k, val in pairs(mapping[3]) do
                         opts[k] = val
                    end
                end
            end

            if use_buffer_n ~= nil then
                vim.api.nvim_buf_set_keymap(use_buffer_n, mode, key, rhs, opts)
            else
                vim.api.nvim_set_keymap(mode, key, rhs, opts)
            end
        end
    end
end

return M
