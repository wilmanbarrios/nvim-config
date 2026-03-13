local map = vim.keymap.set

-- splits
map("n", "sv", "<cmd>vsplit<CR>")
map("n", "ss", "<cmd>split<CR>")

-- save file only when there are changes
map("n", "<Leader>w", "<cmd>up<CR>")

-- quit file
map("n", "<Leader>q", "<cmd>q<CR>")

-- clear search highlight
map("n", "<Leader><Space>", "<cmd>nohls<CR>")

-- center cursor when navigating backward/forward
map("n", "<C-O>", "<C-O>zz", { silent = true })
map("n", "<C-I>", "<C-I>zz", { silent = true })

-- show highlight group under cursor
map("n", "<Leader>hg", "<cmd>Inspect<CR>")
map("n", "<Leader>hp", "<cmd>InspectTree<CR>")

-- move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- join visual selected lines
map("v", "<Leader>j", ":j<CR>")

-- yank to clipboard
map({ "n", "v" }, "<Leader>y", '"+y')

-- visual line navigation
map("n", "j", "gj")
map("n", "k", "gk")
