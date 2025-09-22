-- Blink
require('blink.cmp').setup {
  keymap = {
    preset = 'default',
    ['Tab'] = false,
    ['<S-Tab>'] = false,
    ['<C-l>'] = { 'snippet_forward', 'fallback' },
    ['<C-h>'] = { 'snippet_backward', 'fallback' },
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
    menu = {
      border = 'padded',
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      -- luasnip_choice = {
      --   name = "luasnip_choice",
      --
      -- },
    },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true },
}
