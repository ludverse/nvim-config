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

-- User opts
vim.g.mapleader = " "
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.mouse = ""

vim.cmd("colorscheme tokyonight-night")

require("lualine").setup({
    options = {
        component_separators = {
            left = "|",
            right = "|"
        },
        section_separators = {
            left = "",
            right = ""
        }
    }
})

require("bufferline").setup({

})
