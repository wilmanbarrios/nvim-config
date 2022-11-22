-- leader key
vim.g.mapleader = ' '

pcall(require, "impatient")

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

require('wdx.plugins')

require "wdx.telescope.setup"
require "wdx.telescope.mappings"
