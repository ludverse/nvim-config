return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        setup = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close
                        }
                    }
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
