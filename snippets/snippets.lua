local ls = require 'luasnip'

ls.add_snippets(nil, {
  all = {
    {
      -- Available in any filetype
      ls.parser.parse_snippet('expand', '-- this is what was expanded!'),
    },
    {
      -- Available in any filetype
      ls.parser.parse_snippet('foo', '-- bar'),
    },
  },
})
