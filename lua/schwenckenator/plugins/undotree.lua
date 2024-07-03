-- Undotree
return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>tu', '<CMD>UndotreeToggle<CR>', { desc = '[T]oggle [U]ndotree' })
  end,
}
