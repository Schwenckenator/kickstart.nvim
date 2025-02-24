return {
  'schwenckenator/done.nvim',
  config = function()
    require 'done'
    vim.keymap.set('n', '<leader>td', '<CMD>DoneToggle<CR>', { desc = 'Toggle Done' })
    -- vim.keymap.set('n', '<leader>Dd', '<CMD>DoneTaskDone<CR>', { desc = 'Task Done' })
    -- vim.keymap.set('n', '<leader>Df', '<CMD>DoneTaskForward<CR>', { desc = 'Task Forwarded' })
    -- vim.keymap.set('n', '<leader>Di', '<CMD>DoneTaskInProgress<CR>', { desc = 'Task In Progress' })
  end,
}
