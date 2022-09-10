-- leader key
vim.g.mapleader = ' '

pcall(require, "impatient")

require('wdx.plugins')

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

require "wdx.telescope.setup"
require "wdx.telescope.mappings"
