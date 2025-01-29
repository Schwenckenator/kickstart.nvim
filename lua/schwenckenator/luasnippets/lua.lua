local utils = require 'schwenckenator.luasnippets.utils'

return {
  s(
    {
      name = 'Snippet File',
      trig = 'snfile',
      desc = 'Creates a luasnip snippet file',
    },
    fmta(
      [[
      local utils = require 'schwenckenator.luasnippets.utils'

      return {
        <snippets>
      }
      ]],
      {
        snippets = i(1),
      }
    )
  ),
  s(
    {
      name = 'Snippet',
      trig = 'snip',
      desc = 'Creates a luasnip snippet',
    },
    fmta("\ns(\n  {\n    name = '<>',\n    trig = '<>',\n    desc = '<>',\n  },\n  fmta(\n    [[\n      <>\n    ]]\n  ,\n  {\n    <>\n  })\n),<>", {
      i(1, 'name?'),
      i(2, 'trigger?'),
      i(3, 'description?'),
      i(4, 'snippet?'),
      i(5, 'nodes?'),
      i(0),
    })
  ),
  s(
    {
      name = 'Choice snippet node',
      trig = 'cn',
      desc = 'A luasnip snippet choice node',
    },
    fmta(
      [[
        c(<>, {
          <>
        }),
      ]],
      {
        i(1, 'index?'),
        i(2, 'choices'),
      }
    )
  ),
  s(
    {
      name = 'Choice Test',
      trig = 'testCn',
      desc = 'Testing the choice node highlight',
    },
    fmta(
      [[
        <>
        <>
      ]],
      {
        i(1, 'insert'),
        c(2, {
          t 'choice 1',
          t 'choice 2',
          t 'choice 3',
        }),
      }
    )
  ),
}
