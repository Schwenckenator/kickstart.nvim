local utils = require 'schwenckenator.luasnippets.utils'
-- local ls = require 'luasnip'
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require 'luasnip.util.events'
-- local ai = require 'luasnip.nodes.absolute_indexer'
-- local extras = require 'luasnip.extras'
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require('luasnip.extras.fmt').fmt
-- local fmta = require('luasnip.extras.fmt').fmta
-- local conds = require 'luasnip.extras.expand_conditions'
-- local postfix = require('luasnip.extras.postfix').postfix
-- local types = require 'luasnip.util.types'
-- local parse = require('luasnip.util.parser').parse_snippet
-- local ms = ls.multi_snippet
-- local k = require('luasnip.nodes.key_indexer').new_key

local filename = utils.filename

return {
  s(
    {
      name = 'React Function Component',
      trig = 'rc',
    },
    fmta(
      [[
          import { FC } from 'react'

          export type <file>Props = <props>


          /**
           * <doc>
           */
          const <file>: FC<<<file>Props>> = (props) =>> {
            <cmp>
          }

          export default <file>
        ]],
      {
        file = f(filename, {}),
        doc = i(1, 'TODO DOC COMMENT'),
        props = c(2, {
          sn(nil, {
            i(1, '/* TODO */'),
            t { ' & {', '  ' },
            i(2, '// TODO Props'),
            t { '', '}' },
          }),
          sn(nil, {
            t { '{', '  ' },
            i(1, '// TODO Props'),
            t { '', '}' },
          }),
          sn(nil, {
            i(1, '/* TODO */'),
          }),
        }),
        cmp = i(0),
      }
    )
  ),
  s(
    {
      name = 'React Function Component with *NO* Props',
      trig = 'rcnp',
    },
    fmta(
      [[
        import { FC } from 'react'

        /**
         * <doc>
         */
        const <file>: FC = () =>> {
           <cmp>
        }

        export default <file>
      ]],
      {
        file = f(filename, {}),
        doc = i(1, 'TODO DOC COMMENT'),
        cmp = i(0),
      }
    )
  ),
  s(
    {
      name = 'Next Page Component',
      trig = 'rnpc',
      desc = 'Creates a Nextjs Page Component',
    },
    fmta(
      [[
        import { getTranslations, unstable_setRequestLocale } from 'next-intl/server'
        import { FC } from 'react'

        import { IMetadataParams, IPageProps } from '@/11_types/PageType'

        export async function generateMetadata({ params: { locale } }: IMetadataParams) {
          const t = await getTranslations({ locale, namespace: '<nameRep>Page.metadata' })

          return { 
            title: t('title'),
          }
        }

        /**
         * <doc>のページコンポーネント 
         */
        const <name>Page: FC<<IPageProps>> = (props) =>> {
          unstable_setRequestLocale(props.params.locale)

          <fin>return <<<nameRep>Main {...props} />>
        }

        export default <nameRep>Page
      ]],
      {
        name = i(1),
        nameRep = rep(1),
        doc = i(2, 'TODO DOC COMMENT'),
        fin = i(0),
      }
    )
  ),
  s(
    {
      name = 'Next Layout Component',
      trig = 'rnlc',
      desc = 'Creates a Nextjs Layout Component',
    },
    fmta(
      [[
        import { FC } from 'react',

        import { ILayoutProps } from '@/11_types/PageType'

        /** 
         * <doc>のレイアウトコンポーネント
         */
        const <name>Layout: FC<<ILayoutProps>> = (props) =>> {
          <fin>return <<<nameRep>LayoutMain {...props} />>
        }

        export default <nameRep>Layout
      ]],
      {
        name = i(1),
        nameRep = rep(1),
        doc = i(2, 'TODO DOC COMMENT'),
        fin = i(0),
      }
    )
  ),
}
