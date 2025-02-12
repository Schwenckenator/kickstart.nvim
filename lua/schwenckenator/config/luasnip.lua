-- Set log level
require('luasnip').log.set_loglevel 'debug'
-- Load lua snippets
require('luasnip.loaders.from_lua').lazy_load { paths = { './lua/schwenckenator/luasnippets' } }

-- Add typescript snippets to typescript react files
require('luasnip').filetype_extend('typescriptreact', { 'typescript' })
