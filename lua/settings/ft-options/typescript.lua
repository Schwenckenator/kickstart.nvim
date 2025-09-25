-- Use Js Settings
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Add commands for typescript and similar files (current buffer only)
vim.keymap.set('n', '<leader>cx', '<CMD>EslintFixAll<CR>', {
  desc = '[C]ommand Fi[x]',
  buffer = 0,
})
vim.keymap.set('n', '<leader>cia', '<CMD>TSToolsAddMissingImports<CR>', {
  desc = '[C]ommand [I]mport [A]dd',
  buffer = 0,
})
vim.keymap.set('n', '<leader>cir', '<CMD>TSToolsRemoveUnusedImports<CR>', {
  desc = '[C]ommand [I]mport [R]emove',
  buffer = 0,
})
