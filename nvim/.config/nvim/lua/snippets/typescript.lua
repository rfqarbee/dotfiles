local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
  s(
    "ter",
    fmt("{} ? {} : {}", {
      i(1),
      i(2),
      i(3),
    })
  ),
  s(
    "neaf",
    fmt("const {} = ({}) => {{{}}}", {
      i(1),
      i(2),
      i(3),
    })
  ),
  s(
    "aseaf",
    fmt("async (req {} ,res {}) => {{{}}}", {
      i(1, ": Request"),
      i(2, ": Response"),
      i(3),
    })
  ),
  s(
    "eaf",
    fmt("export const {} = ({}) => {{{}}}", {
      i(1),
      i(2),
      i(3),
    })
  ),
  s(
    "log",
    fmt('console.log("Log: {}",{})', {
      i(1),
      i(2),
    })
  ),
  s(
    "tne",
    fmt("if({}) throw new Error({})", {
      i(1),
      i(2),
    })
  ),
})

ls.filetype_extend("typescript", { "typescriptreact", "javascript", "javascriptreact" })
