-- Which key config
vim.keymap.set('n', '<leader>?', '<CMD>WhichKey<CR>', { desc = 'Display WhichKey' })

local which_key = require 'which-key'

which_key.add {
  { 'gj', group = '[J]sdoc comment' },
  { 'gr', group = 'LSP' },
  { '<leader>c', group = '[C]ommand' },
  { '<leader>ci', group = '[I]mports' },
  { '<leader>s', group = '[S]earch' },
  { '<leader>t', group = '[T]oggle' },
  { '<leader><leader>r', group = '[R]eload config' },
  { '<leader><leader>', group = '[ ] Config' },
}
