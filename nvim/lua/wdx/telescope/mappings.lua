local map_tele = require('wdx.telescope.utils')

map_tele("<Leader>p",  "find_files")
map_tele("<Leader>b",  "buffers")
map_tele("<Leader>fd", "find_in_dotfiles")
-- map_tele("<Leader>fg", "git_files") -- i almost never used this
-- map_tele("<Leader>fv", "find_in_vendors") -- only for PHP code bases
map_tele("<Leader>ht", "help_tags")
map_tele("<Leader>sw", "grep_prompt")
map_tele("<Leader>sq", "grep_string")
-- map_tele("<Leader>sl", "live_grep")
-- map_tele("<Leader>fr", "laravel_routes") -- TODO: in progress
map_tele("<Leader>gr", "lsp_document_symbols")
vim.keymap.set('n', "<Leader>tt", require('telescope.builtin').resume, map_options)
