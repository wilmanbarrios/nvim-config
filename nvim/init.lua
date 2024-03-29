require("wdx.globals")

-- leader key
vim.g.mapleader = " "

require("wdx.disable_builtin")
require("wdx.options")

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

require("lazy").setup("wdx.plugins", {
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
})
