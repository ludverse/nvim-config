return {
    ["lua_ls"] = {
        settings = {
            Lua = {
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "4",
                    }
                },
            }
        }
    },
    ["rust_analyzer"] = {
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    features = "all"
                }
            }
        }
    },
    ["zls"] = {},
    ["tsserver"] = {},
    ["html"] = {
        filetypes = { "vue", "html", "xml", "svg" }
    },
    ["emmet_ls"] = {
        filetypes = { "vue", "html", "xml", "svg" }
    },
    ["cssls"] = {},
    ["volar"] = {}
}
