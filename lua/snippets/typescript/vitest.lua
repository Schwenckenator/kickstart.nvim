local utils = require 'snippets.utils'

return {
  s(
    {
      name = 'Vitest File',
      trig = 'vtfile',
      desc = 'Vitest File scaffolding',
    },
    fmta(
      [[
        import { afterEach, expect, test, describe, vi } from 'vitest'

        import { cleanup, screen, userEvent, render } from '@/98_tests-unit/vitestUtils'

        type IOptions = Partial<<<options>>>

        <mock>

        function setup(props?: IOptions) {
          const fixedProps = {
            <defaultProps>
          }
          const user = userEvent.setup()
          const { container } = render(
            <cmp>
          )
          return { container, user }
        }

        /** モック、レンダーをリセットする */
        afterEach(() =>> {
          /* reset mocks */
          cleanup()
        })
         
        <fin>
      ]],
      {
        cmp = i(1, '<Component?>'),
        options = i(2, 'option_type?'),
        defaultProps = i(3, 'defaultProps?'),
        mock = c(4, {
          { t { '', 'const handle' }, i(1, 'MOCK?'), t { ' = vi.fn()', '' } },
          t '',
        }),
        fin = i(0),
      }
    )
  ),
  s(
    {
      name = 'Vitest test case',
      trig = 'vt',
      desc = 'A single test case for Vitest',
    },
    fmta(
      [[
        test('<>', <>() =>> {
          <>setup(<>)
          <>
          expect(<>).<>
        })
        <>
      ]],
      {
        i(1, 'name?'),
        c(2, {
          t 'async ',
          t '',
        }),
        c(3, {
          t 'const { user } = ',
          t '',
        }),
        c(4, {
          i(1, 'props?'),
          t '',
        }),
        c(5, {
          i(1, 'user action?'),
          t '',
        }),
        i(6, 'test subject?'),
        i(7, 'test value?'),
        i(0),
      }
    )
  ),
  s(
    {
      name = 'Vitest Describe',
      trig = 'vtd',
      desc = 'A Vitest describe block',
    },
    fmta(
      [[
        describe('<>', () =>> {
          <>
        })
      ]],
      {
        i(1, 'name?'),
        i(0),
      }
    )
  ),
}
