return {
    {
        "akinsho/bufferline.nvim",
        dependencies = { "folke/tokyonight.nvim" },
        opts = {
            options = {
                separator_style = { "█", "█" },
                diagnostics = "nvim_lsp",
                indicator = {
                    style = "none"
                },
                show_buffer_close_icons = false,
                tab_size = 0,
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    if level == "info" then
                        return "󰋽 " .. count
                    elseif level == "hint" then
                        return "󰌶 " .. count
                    elseif level == "warning" then
                        return "󰀪 " .. count
                    elseif level == "error" then
                        return "󰅚 " .. count
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
