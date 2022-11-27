local nvim_tree = require'nvim-tree'

nvim_tree.setup {
  filters = {
    custom = {".git", "dotbot"},
    exclude = {".env"}
  },
  view = {
    width = 41,
    side = "right",
  },
}

vim.keymap.set("n", "<C-b>", nvim_tree.toggle, {silent = true, noremap = true})

local reveal = function()
  nvim_tree.find_file(true)
end
vim.keymap.set("n", "<Leader>l", reveal, {silent = true, noremap = true})
