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

require("lazy").setup(require("plugins"), opts)
require("lsp")
require("maploader")

-- User opts
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.mouse = ""
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.relativenumber = true
vim.o.number = true
vim.o.swapfile = false
vim.o.scrolloff = 8

-- set leader key to no operation so no-one else will use it
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", {});

