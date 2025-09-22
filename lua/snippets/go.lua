local utils = require 'snippets.utils'

return {
  s(
    {
      name = 'If Error',
      trig = 'ife',
      desc = 'Creates a custom hook without props',
    },
    fmta(
      [[
         if err != nil {
           return <params>err
         }
         <finish>
      ]],
      {
        params = i(1),
        finish = i(0),
      }
    )
  ),

  -- s({
  --   name = 'Error if',
  --   trig = 'efi',
  --   desc = 'if error is not null snippet',
  -- }, {
  --   fmta([[
  --     <val>, <err> := <f>(<args>)
  --     if <err> != nil {
  --       return <result>
  --     }
  --     <finish>
  --   ]],
  --       {
  --         val = i()
  --       }
  --     )
  -- }),
}
