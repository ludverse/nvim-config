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
opts?: either table or function(plugin_spec, opts)

lazy.nvim will use either the table itself or the return value of the function to call setup(opts) on the plugin

if opts is not specified lazy.nvim will not call the setup method

note: you should never have to use opts as a function since config often more suitable (see config)
note: do not call setup() manually inside opts function (see config)

lazy docs: opts should be a table (will be merged with parent specs), return a table (replaces parent specs) or should change a table. The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()

----
config?: either function(plugin_spec, opts) or true
    plugin_spec: LazyPlugin (see https://github.com/folke/lazy.nvim)
    opts: table

lazy.nvim will call this function to let you handle the setup and configuration of the plugin. If config is a function, lazy.nvim will not call setup on the plugin

config = true is equivalent to setting opts = {}, which is the recomended way of doing it

you can use config and opts together as the opts table will be passed as the second argument to this function (see opts)

lazy docs: config is executed when the plugin loads. The default implementation will automatically run require(MAIN).setup(opts) if opts or config = true is set. Lazy uses several heuristics to determine the plugin's MAIN module automatically based on the plugin's name. (opts is the recommended way to configure plugins).

----
init?: function(plugin_spec)
    plugin_spec: LazyPlugin (see https://github.com/folke/lazy.nvim)

a function that will run on nvim startup no matter what, even if plugin is lazy loaded

----

--]]

return {
    {
        "neovim/nvim-lspconfig",
        version = "^0.1.8",
    },

    {
        "folke/which-key.nvim",
        version = "^2.1.0",
        opts = {},
    },

    {
        "folke/tokyonight.nvim",
        version = "^4.4.0",
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end,
    },

    {
        -- nice vim.input and vim.select boxes
        "stevearc/dressing.nvim",
        commit = "6741f10",
    },

    {
        "numToStr/Comment.nvim",
        version = "^0.8.0",
        opts = {
            mappings = false
        }
    },

    -- { "sigmaSd/deno-nvim", lazy = true }, remove?

    {
        -- for neovim lua lsp types
        "folke/neodev.nvim",
        opts = {}
    },

    {
        "windwp/nvim-autopairs",
        commit = "78a4507",
        lazy = true,
        event = "InsertEnter",
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "^2.3.0",
        lazy = true,
        event = "BufEnter",
        opts = {
        },
        init = function()

        end
    }
}
