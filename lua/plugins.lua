return {
    {
        "folke/which-key.nvim",
        opts = {},
    },
    {
        "folke/tokyonight.nvim"
    },
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
    {
        "akinsho/bufferline.nvim",
        opts = {}
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { "neovim/nvim-lspconfig" },
    {
        "knubie/nvim-cmp",
        dependencies = { "onsails/lspkind.nvim" },
        opts = function()
            local function has_word_after()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col + 1, col + 1):match("%s") == nil
            end

            local function has_word_before()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require("cmp")
            return {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_word_before() and has_word_after() then
                            local right_key = vim.api.nvim_replace_termcodes("<Right>", true, false, true
        )
                            vim.api.nvim_feedkeys(right_key, "n", false)
                        elseif has_word_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        before = function (entry, vim_item)
                            return vim_item
                        end
                   })
               }
            }
        end
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = false
        },
    },
    { "sar/cmp-lsp.nvim", lazy = true },
    { "L3MON4D3/LuaSnip", lazy = true },
    { "sigmaSd/deno-nvim", lazy = true },
    { "folke/neodev.nvim", opts = {} }
}
