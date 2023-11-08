local map_tele = require("wdx.telescope.utils")

map_tele("<Leader>p", "find_files")
map_tele("<Leader>b", "buffers")
map_tele("<Leader>fd", "find_in_dotfiles")
map_tele("<Leader>ht", "help_tags")
map_tele("<Leader>sw", "grep_prompt")
map_tele("<Leader>sq", "grep_string")

vim.keymap.set(
  "n",
  "<Leader>gr",
  require("telescope.builtin").lsp_document_symbols
)
vim.keymap.set("n", "<Leader>tt", require("telescope.builtin").resume)
