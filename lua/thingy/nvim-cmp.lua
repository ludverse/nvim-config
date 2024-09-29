local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	completion = {
		autocomplete = { "InsertEnter", "TextChanged" }
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "lazydev" }
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol",
			maxwidth = 30,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				-- to make the popup menus not stretch all the way to the edge because idk nvim-cmp is stupid
				vim_item.menu = ""

				return vim_item
			end

		}),
		-- fields = { "kind", "abbr" },
	},
	-- window = {
	-- 	completion = cmp.config.window.bordered(),
	-- 	documentation = cmp.config.window.bordered(),
	-- }
})
