-- Playwright Test Snippets
return {
  s(
    {
      name = 'playwrightTest',
      trig = 'pt',
      desc = 'Playwright Test case',
    },
    fmta(
      [[
        test('<>', async ({<>}) =>> {
           <>
        })
      ]],
      {
        i(1, 'Test name'),
        i(2),
        i(0),
      }
    )
  ),

  s(
    {
      name = 'playwrightDescribe',
      trig = 'pd',
      desc = 'Playwright Describe',
    },
    fmta(
      [[
        test.describe(() =>> {
          <>
        })
      ]],
      {
        i(0),
      }
    )
  ),

  s(
    {
      name = 'playwrightBeforeEach',
      trig = 'pbe',
      desc = 'Playwright BeforeEach hook',
    },
    fmta(
      [[
        test.beforeEach(async ({<>}) =>> {
           <>
        })
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),

  s(
    {
      name = 'Playwright After Each',
      trig = 'pae',
      desc = 'Playwright After Each hook',
    },
    fmta(
      [[
        test.afterEach(async ({<>}) =>> {
           <>
         })
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),
}
