local utils = require 'snippets.utils'

return {
  s(
    {
      name = 'React Custom Hook',
      trig = 'rh',
      desc = 'Creates a custom hook',
    },
    c(1, {
      fmta(
        [[
        type <file>Props = {
          <type>
        }

        /**
        * <doc>
        */
        export default function <file>(props: <file>Props) {
          <hook>
        }
      ]],
        {
          file = f(utils.filename, {}),
          type = i(1, '// TODO TYPE'),
          doc = i(2, 'TODO DOC COMMENT'),
          hook = i(0),
        }
      ),
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
      ),
    })
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
      name = 'reactUseState',
      trig = 'ust',
      desc = 'React useState hook',
    },
    fmta(
      [[
        const [<state>, set<setstate>] = useState<type>(<default>)
        <fin>
        ]],
      {
        state = i(1),
        setstate = dl(2, l._1:sub(1, 1):upper() .. l._1:sub(2, -1), { 1 }), -- Dynamic lambda
        type = c(3, {
          sn(nil, {
            t '<',
            i(1, 'type'),
            t '>',
          }),
          t '',
        }), -- choice -> typed <i(0)> || ''
        default = i(4), -- default input: Make it based on 3
        fin = i(0), --
      }
    )
  ),
  s(
    {
      name = 'reactUseRef',
      trig = 'ur',
      desc = 'React useRef hook',
    },
    fmta(
      [[
        const <ref> = useRef<type>(<default>)
        <fin>
        ]],
      {
        ref = i(1),
        type = c(2, {
          sn(nil, {
            t '<',
            i(1, 'type'),
            t '>',
          }),
          t '',
        }),
        default = i(3, 'null'),
        fin = i(0),
      }
    )
  ),
  s({
    name = 'React Children Comment',
    trig = 'cChild',
    desc = 'React component children',
  }, {
    t { '/** 子要素 */', 'children: ReactNode' },
  }),
}
