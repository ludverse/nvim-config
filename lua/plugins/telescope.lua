local mappings = require("mappings")

return {
    {
        "nvim-telescope/telescope.nvim",
        version = "^0.1.5",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        setup = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    mappings = mappings.telescope
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                            }
                        }
                    },
                }
            })
            require("telescope.builtin").diagnostics({ sort_by = "severity" })
        end
    },
}
