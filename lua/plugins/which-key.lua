-- Which key config
vim.keymap.set('n', '<leader>?', '<CMD>WhichKey<CR>', { desc = 'Display WhichKey' })

local which_key = require 'which-key'

which_key.add {
  { 'gj', group = '[J]sdoc comment' },
  { 'gr', group = 'LSP' },
  -- { '<leader>ci', group = '[I]mports' },
  -- { '<leader>d', group = '[D]ocument' },
  -- { '<leader>f', group = '[F]ile' },
  -- { '<leader>g', group = '[G]it' },
  -- { '<leader>r', group = '[R]ename' },
  { '<leader>s', group = '[S]earch' },
  { '<leader>t', group = '[T]oggle' },
  -- { '<leader>T', group = '[T]est' },
  -- { '<leader>Tv', group = '[T]est [V]itest' },
  -- { '<leader>v', group = '[V]oid' },
  -- { '<leader>w', group = '[W]orkspace' },
  -- { '<leader>x', group = 'Fi[X]' },
  { '<leader><leader>r', group = '[R]eload config' },
  { '<leader><leader>', group = '[ ] Config' },
}
