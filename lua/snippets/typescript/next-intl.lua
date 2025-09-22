-- Next intl snippets
local utils = require 'snippets.utils'

return {
  s(
    {
      name = 'useTranslations',
      trig = 'ut',
      desc = 'use translation hook for component',
    },
    fmta(
      [[
        const t = useTranslations('<>')
        <>
      ]],
      {
        f(utils.filename, {}),
        i(0),
      }
    )
  ),
}
