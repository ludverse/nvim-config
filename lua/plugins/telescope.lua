local small_layout_config = {
    height = 0.5,
    preview_cutoff = 40,
    prompt_position = "top",
    width = 0.4
}

return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        commit = "f5363d3c2a4ab73f915550a61711b9376f5bbf6b", -- because that commit they added diagnostics sort_by option
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    sorting_strategy = "ascending",
                    layout_config = {
                        height = 0.7,
                        preview_cutoff = 40,
                        prompt_position = "top",
                        width = 0.6
                    },
                    selection_caret = " ",
                    entry_prefix = " ",
                    multi_icon = "",
                    preview = false,
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close
                        },
                    }
                },
                pickers = {
                    buffers = {
                        layout_config = small_layout_config,
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                            }
                        },
                        sort_lastused = true
                    },
                    git_files = {
                        layout_config = small_layout_config
                    },
                    find_files = {
                        layout_config = small_layout_config
                    },
                    diagnostics = {
                        sort_by = "severity"
                    }
                }
            })
        end
    },
}
