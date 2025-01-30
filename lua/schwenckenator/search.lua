-- Search Helpers
vim.keymap.set('n', '<C-/>', '/<C-R>/', { noremap = true, desc = '[/] Search with previous search' })
vim.keymap.set('n', '<C-S-/>', '?<C-R>/', { noremap = true, desc = '[?] Search with previous search' })
vim.keymap.set('n', 'R', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>', { noremap = true, desc = '[R]eplace word under cursor' })

vim.keymap.set('c', '<C-Space>', [[\(.*\)]], { noremap = true, desc = 'Insert Capture all' })
