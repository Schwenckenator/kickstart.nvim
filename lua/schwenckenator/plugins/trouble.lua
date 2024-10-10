-- Add project wide error / Todo checking
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    require 'schwenckenator.config.trouble'
  end,
}
