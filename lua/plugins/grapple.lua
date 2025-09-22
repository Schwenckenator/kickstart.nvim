-- Grapple
local grapple = require 'grapple'

grapple.setup { scope = 'git_branch' }

local maps = {
  { '<leader>m', '<CMD>Grapple toggle<CR>', desc = 'Toggle Tag [M]ark' },
  { '<leader>M', '<CMD>Grapple toggle_tags<CR>', desc = 'Toggle Tags [M]enu' },
  { '<leader>1', '<CMD>Grapple select index=1<CR>', desc = 'Select Tag [1]' },
  { '<leader>2', '<CMD>Grapple select index=2<CR>', desc = 'Select Tag [2]' },
  { '<leader>3', '<CMD>Grapple select index=3<CR>', desc = 'Select Tag [3]' },
  { '<leader>4', '<CMD>Grapple select index=4<CR>', desc = 'Select Tag [4]' },
  { '<leader>5', '<CMD>Grapple select index=5<CR>', desc = 'Select Tag [5]' },
  { '<leader>6', '<CMD>Grapple select index=6<CR>', desc = 'Select Tag [6]' },
  { '<leader>7', '<CMD>Grapple select index=7<CR>', desc = 'Select Tag [7]' },
  { '<leader>8', '<CMD>Grapple select index=8<CR>', desc = 'Select Tag [8]' },
  { '<leader>9', '<CMD>Grapple select index=9<CR>', desc = 'Select Tag [9]' },
}

for _, map in ipairs(maps) do
  vim.keymap.set('n', map[1], map[2], { desc = map.desc })
end
