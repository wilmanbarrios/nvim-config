return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local rep = require("luasnip.extras").rep
    local s = ls.s
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local f = ls.function_node
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local r = ls.restore_node

    ls.config.setup({
      store_selection_keys = "<Tab>",
    })

    local function get_visual_selection(_, parent)
      return parent.snippet.env.LS_SELECT_DEDENT or {}
    end

    local function commentstring()
      local cs = require("ts_context_commentstring").calculate_commentstring()

      if cs == nil then
        return nil
      end

      local parts = vim.split(cs, " ")

      return { left = parts[1], right = parts[3] or "" }
    end

    ls.add_snippets("all", {
      s(
        "todo",
        fmta("<left_commentstring> TODO<type>: <text> <right_commentstring>", {
          left_commentstring = f(function()
            return commentstring().left
          end),
          type = c(1, {
            t("(wilman)"),
            t(""),
          }),
          text = i(2),
          right_commentstring = f(function()
            return commentstring().right
          end),
        })
      ),
    })

    local javascript = {
      s(
        "log",
        fmta([[console.log(<>)]], {
          c(1, {
            fmta([["<>"]], { r(1, "variable") }),
            fmta([[{<>}]], { r(1, "variable") }),
            fmta([["\n\n\n", {<>}]], { r(1, "variable") }),
            fmta([[JSON.stringify(<>, null, 2)]], { r(1, "variable") }),
            fmta([[JSON.stringify({<>}, null, 2)]], { r(1, "variable") }),
          }),
        })
      ),

      s(
        "prof",
        fmt(
          [[
           console.time('{}')
           {}
           console.timeEnd('{}')
          ]],
          {
            i(1),
            sn(2, {
              f(get_visual_selection),
            }),
            rep(1),
          }
        )
      ),

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
              name = r(1, "fn_name"),
              async = c(2, {
                t(""),
                t("async "),
              }),
              params = r(3, "fn_params"),
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
              name = r(1, "fn_name"),
              async = c(2, {
                t(""),
                t("async "),
              }),
              params = r(3, "fn_params"),
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
      javascriptreact = javascript,
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
    vim.keymap.set({ "i", "s" }, "<C-e>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    -- expand current snippet
    vim.keymap.set("i", "<C-j>", function()
      if ls.expandable() then
        ls.expand()
      end
    end, { silent = true })
  end,
}
