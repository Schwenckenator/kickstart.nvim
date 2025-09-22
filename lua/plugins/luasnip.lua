local luasnip = require 'luasnip'
local luasnip_types = require 'luasnip.util.types'

-- Set log level
luasnip.log.set_loglevel 'debug'
-- Load lua snippets
require('luasnip.loaders.from_lua').lazy_load { paths = { './lua/snippets' } }

-- Add typescript snippets to typescript react files
luasnip.filetype_extend('typescriptreact', { 'typescript' })

luasnip.config.setup {
  ext_opts = {
    [luasnip_types.choiceNode] = {
      active = {
        virt_text = { { '->', 'TodoBgTodo' } },
        virt_text_pos = 'inline',
        hl_mode = 'combine',
      },
    },
  },
}

-- Set Choice keymap here
vim.keymap.set({ 'i', 's' }, '<C-e>', function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })

-- Setup building of Luasnip
vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle luasnip updates',
  group = vim.api.nvim_create_augroup('nvim-luasnip-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'luasnip' then
      vim.notify('luasnip updated, building...', vim.log.levels.INFO)

      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        vim.notify("'make' is missing, aborting!", vim.log.levels.INFO)
        return
      end

      vim.notify('Building Luasnip regex support...', vim.log.levels.INFO)
      vim.fn.system { 'make', 'install_jsregexp' }
    end
  end,
})
