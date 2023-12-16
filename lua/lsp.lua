-- Setup nvim-cmp
--local cmp = require("cmp");
--cmp.setup({
--    snippet = {
--        expand = function(args)
--            require("luasnip").lsp_expand(args.body)
--        end
--    },
--    sources = cmp.config.sources({
--        { name = "nvim_lsp" },
--        { name = "luasnip" },
--    }, {
--        { name = "buffer" },
--    }),
--    formatting = {
--        format = require("lspkind").cmp_format({
--            mode = "symbol",
--            maxwidth = 50,
--            ellipsis_char = "...",
--            before = function (entry, vim_item)
--                return vim_item
--            end
--        })
--    }
--})

-- get capabilities for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities

-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    --capabilities = capabilities
})
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {},
    },
})
lspconfig.denols.setup({
    --capabilities = capabilities
})

