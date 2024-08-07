local options = require("thingy.configs.options")
for key, val in pairs(options) do
	vim.o[key] = val
end

vim.g.mapleader = " "

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("thingy.plugins");

local maploader = require("thingy.maploader")
maploader.set_mappings(require("thingy.mappings.global"))
require("thingy.lsp_maploader")

require("thingy.diagnostics")
