local utils = require 'snippets.utils'

return {
  s(
    {
      name = 'React Kind',
      trig = 'rkind',
      desc = 'Create a Kind type',
    },
    fmta(
      [[
        import { useTranslations } from 'next-intl'
        
        import { ICommonKind } from './CommonKind'

        /**
         * <comment>
         */

        export const <filename> = {
          /** <kindComment> */
          <kind>
        }

        export type I<filename> = (typeof <filename>)[keyof typeof <filename>]

        <list>

      ]],
      {
        filename = f(utils.filename, {}),
        comment = i(1),
        kind = i(2),
        kindComment = i(3),
        list = c(4, {
          sn(
            nil,
            fmta(
              [[
              export const use<filename>List = (): ICommonKind<<I<filename>>>[] =>> {
                const t = useTranslations('KindList.<lowerFilename>List')

                return [
                  { value: <filename>.<firstValue>, name: t('<firstName>') },
                ]
              }
            ]],
              {
                filename = f(utils.filename, {}),
                lowerFilename = f(utils.filenameLower, {}),
                firstValue = i(1),
                firstName = i(2),
              }
            )
          ),
          t '',
        }),
      }
    )
  ),
}
