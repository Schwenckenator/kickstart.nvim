-- [[
--   My new neovim 12 config
-- ]]

-- Set leaders before anything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- I have a nerd font
vim.g.have_nerd_font = true

-- Load settings
require 'settings.options'
require 'settings.keymaps'
require 'settings.autocmds'
require 'settings.plugins'
require 'settings.lsp'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
