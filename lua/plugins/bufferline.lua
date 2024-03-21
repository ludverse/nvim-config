return {
    {
        "akinsho/bufferline.nvim",
        dependencies = { "folke/tokyonight.nvim" },
        opts = {
            options = {
                separator_style = { "█", "█" },
                indicator = {
                    style = "none"
                },
                show_buffer_close_icons = false,
                tab_size = 0,
                sort_by = function(buf_a, buf_b)
                    local bufinfo_a = vim.fn.getbufinfo(buf_a.id)[1]
                    local bufinfo_b = vim.fn.getbufinfo(buf_b.id)[1]

                    local lastused_a = bufinfo_a.lastused
                    local lastused_b = bufinfo_b.lastused

                    return lastused_a > lastused_b
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
