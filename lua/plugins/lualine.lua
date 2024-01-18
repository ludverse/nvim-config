local expanding = true
local current_text = ""
local status_text = "ludverse"
local should_refresh = true

local function format_text()
    local padding = string.rep(" ", #status_text - #current_text)
    if expanding then
        return " [" .. current_text .. padding .. "] "
    else
        return " [" .. padding .. current_text .. "] "
    end
end

return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                component_separators = {
                    left = "",
                    right = ""
                },
                section_separators = {
                    left = "",
                    right = ""
                }
            },
            sections = {
                lualine_b = {},
                lualine_c = { "filename", "diagnostics" },
                lualine_x = {{
                    function(a)
                        if not should_refresh then
                            return format_text()
                        end

                        should_refresh = false

                        if expanding then
                            current_text = string.sub(status_text, #status_text - #current_text)
                            if #current_text == #status_text then
                                expanding = false
                            end
                        else
                            current_text = string.sub(status_text, 0, #current_text - 1)
                            if #current_text == 0 then
                                expanding = true
                            end
                        end

                        local timer = vim.loop.new_timer()
                        timer:start(1000, 0, vim.schedule_wrap(function()
                            should_refresh = true
                            require("lualine").refresh()
                        end))

                        return format_text()
                    end
                }, "searchcount", "encoding", "location" },
                lualine_y = {},
                lualine_z = {}
            }
        }
    },
}
