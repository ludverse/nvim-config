--[[
lazy.nvim documentation cuz countless lifetimes are wasted every year because of bad documentation

"real" docs: https://github.com/folke/lazy.nvim
much more helpful article: https://dev.to/vonheikemen/lazynvim-plugin-configuration-3opi

----
lazy?: boolean
default: false

if true lazy.nvim will only call the setup function for the plugin or config function when it's required

the plugin will become required when any of these conditions occur:
    - some code calls require("[plugin]") on it
    - event is triggered (see event, NOT WRITTEN YET)
    - some other plugin depends on it (see dependencies, NOT WRITTEN YET)

----
opts?: either table or function()

lazy.nvim will use either the table itself or the return value of the function to call setup(opts) on the plugin

if opts is not specified lazy.nvim will not call the setup method

note: you should never have to use opts as a function since config often more suitable (see config)
note: do not call setup() manually inside opts function (see config)

----
config?: function(plugin_spec, opts)
    plugin_spec: LazyPlugin (see https://github.com/folke/lazy.nvim)
    opts: table

lazy.nvim will call this function to let you handle the all configuration as lazy.nvim will not call setup on the plugin if config is supplied

you can use config and opts together as the opts table will be passed as the second argument to this function

----
init: function(plugin_spec)
    plugin_spec: LazyPlugin (see https://github.com/folke/lazy.nvim)

will run on nvim startup no matter what, even if plugin is lazy loaded

----

--]]

return {
    { "neovim/nvim-lspconfig" },
    { "folke/which-key.nvim", opts = {} },

    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end
    },

    {
        "stevearc/dressing.nvim"
    },

    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = false
        }
    },

    { "sigmaSd/deno-nvim", lazy = true },
    { "folke/neodev.nvim", opts = {} },
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        config = true
    }
}
