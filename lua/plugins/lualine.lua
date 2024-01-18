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
                lualine_x = { "location", "encoding" },
                lualine_y = {},
                lualine_z = {},
            }
        }
    },
}
