-- Mason

local servers = {
  'lua-language-server',
  'stylua',
}

require('mason').setup()

require('mason-tool-installer').setup { ensure_installed = servers }
