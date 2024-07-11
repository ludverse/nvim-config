return {
    {
        "ggandor/leap.nvim",
        lazy = false, -- not recommended https://github.com/ggandor/leap.nvim?tab=readme-ov-file#installation
        config = function()
            require("leap").create_default_mappings()
        end,
    },
}
