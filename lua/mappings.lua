return {
    global = {
        n = {
            ["1"] = { function()
                require("telescope.builtin").buffers({
                    sort_mru = true,
                    ignore_current_buffer = true
                })
                end,
                "Quick buffer switcher"
            },
            ["!"] = { require("telescope.builtin").find_files, "Find files" },
            ["<Leader>w"] = { ":bd<Enter>", "Close buffer", { silent = true } },
            ["<Leader>li"] = {
                ":LspInfo<Enter>",
                "Show LSP info",
                { silent = true }
            },
            ["<C-h>"] = { ":wincmd h<CR>", "Switch to buffer left", { silent = true } },
            ["<C-j>"] = { ":wincmd j<CR>", "Switch to buffer down", { silent = true } },
            ["<C-k>"] = { ":wincmd k<CR>", "Switch to buffer up", { silent = true } },
            ["<C-l>"] = { ":wincmd l<CR>", "Switch to buffer right", { silent = true } }
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
                    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true
)
                    vim.api.nvim_feedkeys(esc, "nx", false)
                    require("Comment.api").toggle.blockwise(vim.fn.visualmode())
                end,
                "Toggle linewise comment"
            }
        },

        i = {
            ["<C-Space>"] = { require("cmp").complete }
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

        v = {
            ["<Leader>la"] = { vim.lsp.buf.code_action, "Code actions" }
        }
    },

    diagnostics = {

    }
}
