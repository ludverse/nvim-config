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

local config_path = vim.fn.stdpath("config")
local is_win = false
if string.find(config_path, "\\") then
    is_win = true
end

local plugins = {}

local plugins_dir = vim.split(vim.fn.glob(config_path .. "/lua/plugins/*"), "\n", { trimempty = true })
for _, path in ipairs(plugins_dir) do
    local dirs = vim.split(path, "/");
    if is_win then
        dirs = vim.split(path, "\\")
    end

    local filename = dirs[#dirs]
    local modname = vim.split(filename, "%.")[1]

    local local_plugins = require("plugins." .. modname)
    for _, plugin in ipairs(local_plugins) do
        table.insert(plugins, plugin)
    end
end

local maploader = require("maploader")
require("lazy").setup(plugins)
require("lsp")

local mappings = require("mappings")
maploader.set_mappings(mappings.global)

maploader.preload_mappings("lsp", mappings.lsp)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(e)
        maploader.set_mappings(mappings.lsp, e.buf)
    end
})

if is_win then
    maploader.set_mappings(mappings.platform.win)

    vim.api.nvim_set_hl(0, "MsgArea", { bg = "#0c0c0c" })
else
    maploader.set_mappings(mappings.platform.unix)

    vim.api.nvim_set_hl(0, "MsgArea", { bg = "#1e1e1e" })
end
