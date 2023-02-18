-- leader key
vim.g.mapleader = ' '

pcall(require, "impatient")

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

require('wdx.plugins')
require('wdx.colorscheme')

require "wdx.telescope.setup"
require "wdx.telescope.mappings"
