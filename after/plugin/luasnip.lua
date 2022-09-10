local ls = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("all", {
    s("todo",  fmt(
      "// TODO{}: {}",
      {
        c(1, {
          t "(wilman)",
          t ""
        }),
        i(0)
      }
    ))
})

ls.add_snippets("php", {
    s("fun", {
      c(1, {
				t("public "),
				t("protected "),
				t("private "),
			}),
      t("function "), i(2),
      t("("), i(3), t(")"), i(4),
      t({ "", "{" }),
      t({ "", "\t" }), i(0),
      t({ "", "}" }),
    }),
    s("sfun", {
      c(1, {
				t("public "),
				t("protected "),
				t("private "),
			}),
      t("static function "), i(2),
      t("("), i(3), t(")"), i(4),
      t({ "", "{" }),
      t({ "", "\t" }), i(0),
      t({ "", "}" }),
    }),
    s("afun", {
      t("function ("), i(1), t(") {"),
      t({ "", "\t" }), i(0),
      t({ "", "}" }),
    }),
    s("fn", {
      t("fn ("), i(1), t(") => "), i(0),
    }),
    s("prop", {
      c(1, {
				t("public "),
				t("protected "),
				t("private "),
			}),
      t("$"), i(2), t(";"), i(0),
    }),
})

-- expand snippet
vim.keymap.set("i", "<Tab>", function()
  if ls.expand_or_jumpable() then
    return '<Plug>luasnip-expand-or-jump'
  else
    return '<Tab>'
  end
end, { silent = true, expr= true })

-- TODO: you are using this?
vim.keymap.set("i", "<S-Tab>", function()
  print("you are using a mapping that you think that you don't use (:...")
  if ls.expand_or_jumpable() then
    ls.jump(-1)
  end
end, { silent = true, noremap = true })

-- next choice
vim.keymap.set("i", "<C-j>", function()
  if ls.choice_active() then
    return '<Plug>luasnip-next-choice'
  else
    return '<C-j>'
  end
end, { silent = true, noremap = true, expr = true })

-- prev choice
vim.keymap.set("i", "<C-k>", function()
  if ls.choice_active() then
    return '<Plug>luasnip-prev-choice'
  else
    return '<C-k>'
  end
end, { silent = true, noremap = true, expr = true })
