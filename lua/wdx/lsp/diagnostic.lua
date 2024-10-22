vim.diagnostic.config({
  severity_sort = true,
  underline = false,
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙 ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})