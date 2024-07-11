return {
    {
        "Wansmer/treesj",
        lazy = true,
        event = "BufEnter",

        keys = {
            {
                "Ht",
                "<CMD>TSJToggle<CR>",
                desc = "Toggle Treesitter join"
            }
        },

        opts = {
            use_default_keymaps = false
        },
    }
}
