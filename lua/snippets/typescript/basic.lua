-- Basic Snippets
return {
  s(
    {
      name = 'for loop',
      trig = 'fr',
      desc = 'Basic for loop',
    },
    fmta(
      [[
        for(let <counter> = 0; <counterRep> << <limit>; <counterRep>++) {
          <fin>
        }
      ]],
      {
        counter = i(1, 'i'),
        counterRep = rep(1),
        limit = i(2),
        fin = i(0),
      }
    )
  ),
  s(
    {
      name = 'for in',
      trig = 'fri',
      desc = 'For x in y loop',
    },
    fmta(
      [[
        for(const <counter> in <array>) {
          <fin>
        }
      ]],
      {
        counter = i(1, 'key'),
        array = i(2, 'array'),
        fin = i(0),
      }
    )
  ),
  s(
    {
      name = 'for of',
      trig = 'fro',
      desc = 'For x of y loop',
    },
    fmta(
      [[
        for(const <counter> of <array>) {
          <fin>
        }
      ]],
      {
        counter = i(1, 'item'),
        array = i(2, 'array'),
        fin = i(0),
      }
    )
  ),
}
