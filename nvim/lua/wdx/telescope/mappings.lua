if not pcall(require, "telescope") then
  return
end

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua require('wdx.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end

map_tele("<Leader>p",  "find_files")
map_tele("<Leader>b",  "buffers")
map_tele("<Leader>fd", "find_in_dotfiles")
map_tele("<Leader>fg", "git_files")
map_tele("<Leader>fv", "find_in_vendors")
map_tele("<Leader>ht", "help_tags")
map_tele("<Leader>sw", "grep_prompt")
map_tele("<Leader>sq", "grep_string")
-- map_tele("<Leader>sl", "live_grep")
-- map_tele("<Leader>fr", "laravel_routes")
map_tele("<Leader>gr", "get_document_symbols")
map_tele("<Leader>tt", "resume")

return map_tele
