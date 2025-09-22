-- Install plugins
vim.pack.add {
  -- Library
  'https://github.com/nvim-lua/plenary.nvim',
  -- Icons
  'https://github.com/nvim-tree/nvim-web-devicons',
  -- Notification window
  'https://github.com/j-hui/fidget.nvim',
  -- Theme
  'https://github.com/catppuccin/nvim',
  -- LSP / linter / formatter installer
  'https://github.com/mason-org/mason.nvim',
  -- Automatically installs the above
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  -- Auto setup lsp default configs
  'https://github.com/neovim/nvim-lspconfig',
  -- Formats files on save
  'https://github.com/stevearc/conform.nvim',
  -- File explorer
  'https://github.com/stevearc/oil.nvim',
  -- Git info in buffer
  'https://github.com/lewis6991/gitsigns.nvim',
  -- Shows keymaps
  'https://github.com/folke/which-key.nvim',
  -- Tree sitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  -- Completion
  'https://github.com/Saghen/blink.cmp',
  'https://github.com/folke/lazydev.nvim',
  -- Snippets
  'https://github.com/L3MON4D3/LuaSnip',
  -- Picker
  'https://github.com/folke/snacks.nvim',
  -- undotree.lua
  'https://github.com/mbbill/undotree',
  -- autopairs.lua ????
  -- debug.lua  -- This is DAP setup, not a single plugin
  -- done.lua -- This is my own plugin, I might rewrite it as a scratchpad
  -- grapple.lua
  'https://github.com/cbochs/grapple.nvim',
  -- lualine.lua
  'https://github.com/nvim-lualine/lualine.nvim',
  -- todo-comments.lua
  'https://github.com/folke/todo-comments.nvim',
  -- Use Automattic html closing tags
  'https://github.com/windwp/nvim-ts-autotag',
  -- Use treesitter to comment lines
  'https://github.com/folke/ts-comments.nvim',
  -- Use better text objects (ai)
  'https://github.com/nvim-mini/mini.ai',
  -- typescript-tools.lua
  'https://github.com/pmizio/typescript-tools.nvim',

  -- Dad bod - SQL in neovim
  'https://github.com/tpope/vim-dadbod',
  'https://github.com/kristijanhusak/vim-dadbod-completion',
  'https://github.com/kristijanhusak/vim-dadbod-ui',
}

-- Load plugins
require 'plugins.theme'
require 'plugins.oil'
require 'plugins.gitsigns'
require 'plugins.which-key'
require 'plugins.conform'

require 'plugins.treesitter'
require 'plugins.lazydev'

require('fidget').setup()

-- Run luasnip before blink
require 'plugins.luasnip'
require 'plugins.blink'

require 'plugins.snacks'
require 'plugins.lualine'
require 'plugins.todo-comments'
require 'plugins.text-editing'

require 'plugins.undotree'
require 'plugins.grapple'

require 'plugins.dadbod'
