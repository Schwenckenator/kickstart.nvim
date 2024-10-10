-- config for Trouble
local previous = ''
local trouble = require 'trouble'

trouble.setup()

vim.keymap.set('n', '<leader>xc', function()
  return '<CMD>Trouble<CR>'
end, { desc = 'Trouble Toggle List' })

vim.keymap.set('n', '<leader>xx', function()
  if previous == '' then
    return '<CMD>Trouble<CR>'
  else
    trouble.toggle(previous)
  end
end, { desc = 'Trouble Previous Toggle' })

vim.keymap.set('n', '<leader>xd', function()
  trouble.toggle 'diagnostics'
  previous = 'diagnostics'
end, { desc = 'Trouble [D]iagnostics' })

vim.keymap.set('n', '<leader>xq', function()
  trouble.toggle 'quickfix'
  previous = 'quickfix'
end, { desc = 'Trouble [Q]uickfix' })

vim.keymap.set('n', '<leader>xl', function()
  trouble.toggle 'loclist'
  previous = 'loclist'
end, { desc = 'Trouble [L]oclist' })

vim.keymap.set('n', '<leader>xt', function()
  trouble.toggle 'todo'
  previous = 'todo'
end, { desc = 'Trouble [T]odos' })

vim.keymap.set('n', 'gR', function()
  trouble.toggle 'lsp_references'
end, { desc = 'Trouble LSP [R]eferences' })
