-- Toggle Markview render
vim.keymap.set('n', '<leader>tm', '<CMD>Markview Toggle<CR>', { noremap = true, desc = '[T]oggle [M]arkview' })

require('markview').setup {
  markdown = {
    headings = {
      shift_width = 0,
      -- heading_1 = {
      --   style = 'icon',
      -- },
      -- heading_2 = {
      --   style = 'icon',
      -- },
      -- heading_3 = {
      --   style = 'label',
      -- },
      -- heading_4 = {
      --   style = 'label',
      -- },
      -- heading_5 = {
      --   style = 'label',
      -- },
      -- heading_6 = {
      --   style = 'label',
      -- },
    },
    list_items = {
      indent_size = 4,
    },
  },
}
