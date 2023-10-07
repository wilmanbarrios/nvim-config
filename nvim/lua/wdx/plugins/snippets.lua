return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
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
    })

    local javascript = {
      s(
        { trig = "fn", dscr = "Insert function block" },
        c(1, {
          fmta(
            [[
              const <name> = <async>(<params>) =>> {
                <content>
              }<finish>
            ]],
            {
              name = i(1),
              async = c(2, {
                t(""),
                t("async "),
              }),
              params = i(3),
              content = i(4),
              finish = i(5),
            }
          ),
          fmta(
            [[
              <async>function <name>(<params>) {
                <content>
              }<finish>
            ]],
            {
              name = i(1),
              async = c(2, {
                t(""),
                t("async "),
              }),
              params = i(3),
              content = i(4),
              finish = i(5),
            }
          ),
        })
      ),

      --- if we have a visual selection wrap it in a try...catch block and when
      --- we don't have a anything visual selected, just add a try...catch block
      s(
        { trig = "try", dscr = "Insert try...catch block" },
        fmt(
          [[
           try {{
             {}{}
           }} catch (err) {{
             {}
           }}
          ]],
          {
            isn(1, {
              f(get_visual_selection),
            }, "$PARENT_INDENT\t"),
            i(2),
            i(3),
          }
        )
      ),

      --- if we have a visual selection wrap it in a if block and when
      --- we don't have a anything visual selected, just add a if block
      s(
        { trig = "if", dscr = "Insert if block" },
        fmt(
          [[
           if ({}) {{
             {}{}
           }}
          ]],
          {
            i(1),
            isn(2, {
              f(get_visual_selection),
            }, "$PARENT_INDENT\t"),
            i(3),
          }
        )
      ),
    }

    ls.add_snippets(nil, {
      javascript = javascript,
      typescript = javascript,
      typescriptreact = javascript,
    })

    -- expand snippet or jump to next stop
    vim.keymap.set("i", "<Tab>", function()
      if ls.expand_or_jumpable() then
        return "<Plug>luasnip-expand-or-jump"
      else
        return "<Tab>"
      end
    end, { silent = true, expr = true })

    -- jump to previous stop
    vim.keymap.set("i", "<S-Tab>", function()
      if ls.expand_or_jumpable() then
        ls.jump(-1)
      end
    end, { silent = true, noremap = true })

    -- toggle choices
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
}
