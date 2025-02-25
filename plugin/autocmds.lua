--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    require("vim.highlight").on_yank()
  end,
})

-- TODO: describe
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

--- Workaround to fix folds when using telescope to open a file
---@see https://github.com/nvim-telescope/telescope.nvim/issues/559
local disabled_fts = { "gitcommit", "fugitive" }
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    if vim.tbl_contains(disabled_fts, vim.bo.filetype) then
      return
    end

    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      command = "normal! zx | zR",
    })
  end,
})

local function get_current_branch()
  local branch =
    vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  if branch ~= "" then
    return branch
  else
    return ""
  end
end

--- If we are creating a commit on a repo that has `JIRA_BOARD_CODE` defined
--- within .env file autocomplete the COOPFE issue code.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    local current_branch = get_current_branch()

    local ignore =
      vim.tbl_contains({ "develop", "master", "main" }, current_branch)
    if ignore then
      return
    end

    local ok, dotenv = pcall(require, "lua-dotenv")
    if not ok then
      vim.notify(
        "Failed to load lua-dotenv. Make sure it's installed.",
        vim.log.levels.WARN
      )
      return
    end

    local cwd = vim.fn.getcwd()
    local env_path = cwd .. "/.env"
    dotenv.load_dotenv(env_path)

    local jira_board_code = dotenv.get("JIRA_BOARD_CODE")
    if not jira_board_code then
      return
    end

    local jira_issue_ticket =
      string.match(current_branch, jira_board_code .. "%-%d+")

    if not jira_issue_ticket then
      return
    end

    -- Insert the text at the start of the first line
    local text = jira_issue_ticket .. ": "
    vim.api.nvim_buf_set_text(ev.buf, 0, 0, 0, 0, { text })
    vim.api.nvim_feedkeys("A", "n", true)
  end,
})
