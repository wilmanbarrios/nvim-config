-- leader key
vim.g.mapleader = " "

require("wdx.disable_builtin")
require("wdx.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable", -- latest stable release
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
package.path = package.path
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua")

require("lazy").setup("wdx.plugins", {
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
})
