-- ***************** --
-- My Custom Plugins --
-- ***************** --

return {
  {
    -- Theme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
      }

      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 4, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = '[+]', -- Text to show when the file is modified.
              readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
            },
          },
          {
            'grapple',
          },
        },
      },
      extensions = { 'oil' },
    },
  },

  {
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        keyword = 'bg',
      },
      search = {
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
  -- Harpoon, tag main files for easy opening
  -- {
  --   'ThePrimeagen/harpoon',
  --   name = 'harpoon',
  --   branch = 'harpoon2',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     local harpoon = require 'harpoon'
  --     vim.keymap.set('n', '<leader>a', function()
  --       harpoon:list():append()
  --     end, { desc = '[A]ttach to harpoon list' })
  --     vim.keymap.set('n', '<leader><space>', function()
  --       harpoon.ui:toggle_quick_menu(harpoon:list())
  --     end, { desc = '[ ] Open Harpoon list' })
  --
  --     vim.keymap.set('n', '<leader>1', function()
  --       harpoon:list():select(1)
  --     end, { desc = 'Open Harpoon file 1' })
  --     vim.keymap.set('n', '<leader>2', function()
  --       harpoon:list():select(2)
  --     end, { desc = 'Open Harpoon file 2' })
  --     vim.keymap.set('n', '<leader>3', function()
  --       harpoon:list():select(3)
  --     end, { desc = 'Open Harpoon file 3' })
  --     vim.keymap.set('n', '<leader>4', function()
  --       harpoon:list():select(4)
  --     end, { desc = 'Open Harpoon file 4' })
  --   end,
  -- },

  -- Grapple, tag main files for easy opening
  {
    'cbochs/grapple.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    opts = {
      scope = 'git',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      { '<leader>a', '<CMD>Grapple tag<CR>', desc = '[A]dd Tag' },
      { '<leader>r', '<CMD>Grapple untag<CR>', desc = '[R]emove Tag' },
      { '<leader>m', '<CMD>Grapple toggle_tags<CR>', desc = 'Toggle Tags [m]enu' },
      { '<leader>1', '<CMD>Grapple select index=1<CR>', desc = 'Select Tag [1]' },
      { '<leader>2', '<CMD>Grapple select index=2<CR>', desc = 'Select Tag [2]' },
      { '<leader>3', '<CMD>Grapple select index=3<CR>', desc = 'Select Tag [3]' },
      { '<leader>4', '<CMD>Grapple select index=4<CR>', desc = 'Select Tag [4]' },
    },
  },

  -- Lazygit, run lazygit in neovim
  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Open Lazy[g]it' })
    end,
  },

  -- Add project wide error / Todo checking
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
      local trouble = require 'trouble'
      trouble.setup()
      vim.keymap.set('n', '<leader>xx', function()
        trouble.toggle()
      end, { desc = 'Trouble Toggle' })
      vim.keymap.set('n', '<leader>xw', function()
        trouble.toggle 'workspace_diagnostics'
      end, { desc = 'Trouble [W]orkspace diagnostics' })
      vim.keymap.set('n', '<leader>xd', function()
        trouble.toggle 'document_diagnostics'
      end, { desc = 'Trouble [D]ocument diagnostics' })
      vim.keymap.set('n', '<leader>xq', function()
        trouble.toggle 'quickfix'
      end, { desc = 'Trouble [Q]uickfix' })
      vim.keymap.set('n', '<leader>xl', function()
        trouble.toggle 'loclist'
      end, { desc = 'Trouble [L]oclist' })
      vim.keymap.set('n', 'gR', function()
        trouble.toggle 'lsp_references'
      end, { desc = 'Trouble LSP [R]eferences' })
    end,
  },

  -- Undo tree
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>tu', '<CMD>UndotreeToggle<CR>', { desc = '[T]oggle [U]ndotree' })
    end,
  },

  -- Autopairs and auto closing tags
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'windwp/nvim-ts-autotag',
    config = true,
  },

  -- Oil file explorer
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'tris203/precognition.nvim',
    event = 'VeryLazy',
    config = {},
  },
}
