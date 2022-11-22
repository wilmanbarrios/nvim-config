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

local nvim_tree_toggle = function()
  nvim_tree.toggle()
end
vim.keymap.set("n", "<C-b>", nvim_tree_toggle, {silent = true, noremap = true})

local nvim_tree_reveal_file_in_explorer = function()
  nvim_tree.find_file(true)
end
vim.keymap.set("n", "<Leader>l", nvim_tree_reveal_file_in_explorer, {silent = true, noremap = true})
