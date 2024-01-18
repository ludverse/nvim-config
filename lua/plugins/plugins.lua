return {
    { "neovim/nvim-lspconfig" },
    { "folke/which-key.nvim", opts = {} },

    {
        "folke/tokyonight.nvim",
        opts = {},
        config = function()
            vim.cmd("colorscheme tokyonight-night")
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
