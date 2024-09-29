local no_snippets_capabilities = require('cmp_nvim_lsp').default_capabilities()
no_snippets_capabilities.textDocument.completion.completionItem.snippetSupport = false

return {
	["lua_ls"] = {
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT'
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME
						-- Depending on the usage, you might want to add additional paths here.
						-- "${3rd}/luv/library"
						-- "${3rd}/busted/library",
					}
					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
					-- library = vim.api.nvim_get_runtime_file("", true)
				}
			})
		end,
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
		capabilities = no_snippets_capabilities,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					features = "all"
				}
			}
		}
	},

	["zls"] = {},

	--["gopls"] = {
	--settings = {
	--gopls = {
	--gofumpt = true
	--}
	--}
	--},

	["gleam"] = {

	},

	["tsserver"] = {},
	["html"] = {
		filetypes = { "vue", "html", "xml", "svg" }
	},
	["emmet_ls"] = {
		filetypes = { "vue", "html", "xml", "svg" }
	},
	["cssls"] = {},
	["volar"] = {},
	["pylsp"] = {},
	["hls"] = {},
}
