local is_inside_work_tree = {}

return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        version = "^0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },

        keys = {
            {
                "<Leader>e",
                function() require("telescope.builtin").buffers() end,
                desc ="Quick buffer switcher"
            },
            {
                "<Leader>f",
                function()
                    local opts = {
                        prompt_title = "Project Files"
                    }

                    local cwd = vim.fn.getcwd()
                    if is_inside_work_tree[cwd] == nil then
                        vim.fn.system("git rev-parse --is-inside-work-tree")
                        is_inside_work_tree[cwd] = vim.v.shell_error == 0
                    end

                    if is_inside_work_tree[cwd] then
                        require("telescope.builtin").git_files(opts)
                    else
                        require("telescope.builtin").find_files(opts)
                    end
                end,
                desc = "Find files"
            },
        },

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
