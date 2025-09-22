local utils = require 'schwenckenator.luasnippets.utils'

return {
  s(
    {
      name = 'Function',
      trig = 'fn',
      desc = 'Creates a function',
    },
    fmt('func {name}({params}) -> {returnType}:\n\t{pass}\n', {
      name = i(1, 'func_name'),
      params = i(2),
      returnType = i(3, 'void'),
      pass = i(4, 'pass'),
    })
  ),
  s(
    {
      name = 'Ready function',
      trig = 'fnr',
      desc = 'Creates a default ready function',
    },
    fmt('func _ready() -> void:\n\t{pass}\n', {
      pass = i(1, 'pass'),
    })
  ),
  s(
    {
      name = 'Process function',
      trig = 'fnp',
      desc = 'Creates a default process function',
    },
    fmt('func _process(delta: float) -> void:\n\t{pass}\n', {
      pass = i(1, 'pass'),
    })
  ),
  s(
    {
      name = 'Physics process function',
      trig = 'fnpp',
      desc = 'Creates a default physics process function',
    },
    fmt('func _physics_process(delta: float) -> void:\n\t{pass}\n', {
      pass = i(1, 'pass'),
    })
  ),
}
