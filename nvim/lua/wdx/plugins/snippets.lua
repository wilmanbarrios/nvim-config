return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local s = ls.s
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local f = ls.function_node
    local isn = ls.indent_snippet_node

    ls.config.setup({
      store_selection_keys = "<Tab>",
    })

    local function get_visual_selection(_, parent)
      return parent.snippet.env.LS_SELECT_DEDENT or {}
    end

    -- TODO(wilman): get the commentstring of the file/location where the todo
    -- comment snippet is called and add it to the snippet
    ls.add_snippets("all", {
      s(
        "todo",
        fmt("// TODO{}: {}", {
          c(1, {
            t("(wilman)"),
            t(""),
          }),
          i(0),
        })
      ),

      --- wrap visual selected code in a try...catch block
      s(
        { trig = "wtry", dscr = "Wrap in a try...catch block" },
        fmt(
          [[
           try {{
             {}
           }} catch (err) {{
             {}
           }}
          ]],
          {
            isn(1, {
              f(get_visual_selection),
            }, "$PARENT_INDENT\t"),
            i(2, "console.log(err)"),
          }
        )
      ),

      --- wrap visual selected code in a if block
      s(
        { trig = "wif", dscr = "Wrap in a if block" },
        fmt(
          [[
           if ({}) {{
             {}
           }}
          ]],
          {
            i(1, "true"),
            isn(2, {
              f(get_visual_selection),
            }, "$PARENT_INDENT\t"),
          }
        )
      ),
    })

    -- expand snippet
    vim.keymap.set("i", "<Tab>", function()
      print("hit!")
      if ls.expand_or_jumpable() then
        print("expanding...")
        return "<Plug>luasnip-expand-or-jump"
      else
        return "<Tab>"
      end
    end, { silent = true, expr = true })

    -- TODO(wilman): you are using this?
    vim.keymap.set("i", "<S-Tab>", function()
      print("you are using a mapping that you think that you don't use (:...")
      if ls.expand_or_jumpable() then
        ls.jump(-1)
      end
    end, { silent = true, noremap = true })

    -- next choice
    vim.keymap.set("i", "<C-j>", function()
      if ls.choice_active() then
        return "<Plug>luasnip-next-choice"
      else
        return "<C-j>"
      end
    end, { silent = true, noremap = true, expr = true })

    -- prev choice
    vim.keymap.set("i", "<C-k>", function()
      if ls.choice_active() then
        return "<Plug>luasnip-prev-choice"
      else
        return "<C-k>"
      end
    end, { silent = true, noremap = true, expr = true })
  end,
}
