local options = require("options")
for key, val in pairs(options) do
    vim.o[key] = val
end

vim.g.mapleader = " "

-- BEGIN LAZY.NVIM
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
-- END LAZY.NVIM

local plugins = {}

local config_path = vim.fn.stdpath("config")
local plugins_dir = vim.split(vim.fn.glob(config_path .. "/lua/plugins/*"), "\n", { trimempty = true })
for _, path in ipairs(plugins_dir) do
    local dirs = vim.split(path, "/")
    local filename = dirs[#dirs]
    local modname = vim.split(filename, "%.")[1]

    local local_plugins = require("plugins." .. modname)
    for _, plugin in ipairs(local_plugins) do
        table.insert(plugins, plugin)
    end
end

require("lazy").setup(plugins)
require("lsp")
require("maploader")

-- set leader key to no operation so no-one else will use it
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", {});

