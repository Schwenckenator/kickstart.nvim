return {
  'cbochs/grapple.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  opts = {
    scope = 'git_branch',
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>a', '<CMD>Grapple tag<CR>', desc = '[A]dd Tag' },
    { '<leader>r', '<CMD>Grapple untag<CR>', desc = '[R]emove Tag' },
    { '<leader>m', '<CMD>Grapple toggle_tags<CR>', desc = 'Toggle Tags [m]enu' },
    { '<leader>1', '<CMD>Grapple select index=1<CR>', desc = 'Select Tag [1]' },
    { '<leader>2', '<CMD>Grapple select index=2<CR>', desc = 'Select Tag [2]' },
    { '<leader>3', '<CMD>Grapple select index=3<CR>', desc = 'Select Tag [3]' },
    { '<leader>4', '<CMD>Grapple select index=4<CR>', desc = 'Select Tag [4]' },
  },
}
