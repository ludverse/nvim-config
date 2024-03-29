local is_inside_work_tree = {}


return {
    global = {
        n = {
            ["<Leader>e"] = {
                function()
                    require("telescope.builtin").buffers()
                end,
                "Quick buffer switcher"
            },
            ["<Leader>f"] = {
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
                "Find files"
            },

            ["<Leader>n"] = { ":enew<Enter>", "New empty buffer" },
            ["<Leader>w"] = { ":bd<Enter>", "Close buffer" },

            ["<Leader>li"] = { ":LspInfo<Enter>", "Show LSP info" },
            ["<Leader>ld"] = { function() require("telescope.builtin").diagnostics() end, "Search diagnostics" },
            ["gl"] = { function() vim.diagnostic.open_float() end, "Hover diagnostics" },

            ["<C-h>"] = { ":wincmd h<CR>", "Switch to buffer left" },
            ["<C-j>"] = { ":wincmd j<CR>", "Switch to buffer down" },
            ["<C-k>"] = { ":wincmd k<CR>", "Switch to buffer up" },
            ["<C-l>"] = { ":wincmd l<CR>", "Switch to buffer right" },
        },

        x = {
            ["gc"] = {
                function()
                    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                    vim.api.nvim_feedkeys(esc, "nx", false)

                    require("Comment.api").toggle.linewise(vim.fn.visualmode())
                end,
                "Toggle linewise comment"
            },
            ["gb"] = {
                function()
                    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                    vim.api.nvim_feedkeys(esc, "nx", false)

                    require("Comment.api").toggle.blockwise(vim.fn.visualmode())
                end,
                "Toggle blockwise comment"
            }
        },

        i = {
            ["<C-s>"] = { function() require("cmp").complete() end }
        },
    },

    lsp = {
        n = {
            ["gD"] = { vim.lsp.buf.declaration, "Go declaration" },
            ["gd"] = { vim.lsp.buf.definition, "Go definition" },
            ["K"] = { vim.lsp.buf.hover, "Symbol hover menu" },
            ["gi"] = { vim.lsp.buf.implementation, "Go implementation" },
            ["gy"] = { vim.lsp.buf.type_definition, "Go type definition" },
            ["gr"] = { vim.lsp.buf.references, "Go references" },
            ["<Leader>lh"] = { vim.lsp.buf.signature_help, "Signature help" },
            ["<Leader>lr"] = { vim.lsp.buf.rename, "Rename symbol" },
            ["<Leader>la"] = { vim.lsp.buf.code_action, "Code actions" }
        },

        x = {
            ["<Leader>la"] = { vim.lsp.buf.code_action, "Code actions" }
        }
    },

    platform = {
        unix = {
            i = {
                [""] = { "<C-w>" }
            }
        },

        win = {

        }
    }
}
