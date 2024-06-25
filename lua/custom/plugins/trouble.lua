-- Add project wide error / Todo checking
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    local trouble = require 'trouble'
    trouble.setup()
    vim.keymap.set('n', '<leader>xx', function()
      trouble.toggle()
    end, { desc = 'Trouble Toggle' })
    vim.keymap.set('n', '<leader>xw', function()
      trouble.toggle 'workspace_diagnostics'
    end, { desc = 'Trouble [W]orkspace diagnostics' })
    vim.keymap.set('n', '<leader>xd', function()
      trouble.toggle 'document_diagnostics'
    end, { desc = 'Trouble [D]ocument diagnostics' })
    vim.keymap.set('n', '<leader>xq', function()
      trouble.toggle 'quickfix'
    end, { desc = 'Trouble [Q]uickfix' })
    vim.keymap.set('n', '<leader>xl', function()
      trouble.toggle 'loclist'
    end, { desc = 'Trouble [L]oclist' })
    vim.keymap.set('n', 'gR', function()
      trouble.toggle 'lsp_references'
    end, { desc = 'Trouble LSP [R]eferences' })
  end,
}
