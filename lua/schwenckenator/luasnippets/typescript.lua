local utils = require 'schwenckenator.luasnippets.utils'

return {
  s(
    {
      name = 'React Custom Hook',
      trig = 'rh',
      desc = 'Creates a custom hook without props',
    },
    fmta(
      [[
        /**
        * <doc>
        */
        export default function <file>() {
          <hook>
        }
      ]],
      {
        file = f(utils.filename, {}),
        doc = i(1, 'TODO DOC COMMENT'),
        hook = i(0),
      }
    )
  ),
  s(
    {
      name = 'reactCustomHookWithProps',
      trig = 'rhp',
      desc = 'Creates a custom hook with props',
    },
    fmta(
      [[
        type I<file>Props = {
          <type>
        }

        /**
        * <doc>
        */
        export default function <file>(props: IProps) {
          <hook>
        }
      ]],
      {
        file = f(utils.filename, {}),
        type = i(1, '// TODO TYPE'),
        doc = i(2, 'TODO DOC COMMENT'),
        hook = i(0),
      }
    )
  ),

  s(
    {
      name = 'reactUseEffect',
      trig = 'ue',
      desc = 'React useEffect hook',
    },
    fmta(
      [[
        useEffect(() =>> {
           <>
          }, [<>])
        ]],
      {
        i(1),
        i(0),
      }
    )
  ),

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
