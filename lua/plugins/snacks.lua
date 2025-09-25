-- Picker

require('snacks').setup {
  picker = {},
  indent = {
    indent = {
      hl = 'LineNr',
    },
    animate = {
      enabled = false,
    },
    scope = {
      hl = 'SnacksIndent2',
    },
  },
}

local searches = {
  { key = '<leader>sp', fun = Snacks.picker, desc = '[S]earch [P]ickers' },
  { key = '<leader>sr', fun = Snacks.picker.resume, desc = '[S]earch [R]esume' },
  { key = '<leader>sh', fun = Snacks.picker.help, desc = '[S]earch [H]elp' },
  { key = '<leader>sf', fun = Snacks.picker.files, desc = '[S]earch [F]iles' },
  { key = '<leader>sg', fun = Snacks.picker.grep, desc = '[S]earch with [G]rep' },
  { key = '<leader>sj', fun = Snacks.picker.jumps, desc = '[S]earch [J]umps' },
  {
    key = '<leader>sn',
    fun = function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
    end,
    desc = '[S]earch [N]eovim Config',
  },
  { key = '<leader>sk', fun = Snacks.picker.keymaps, desc = '[S]earch [K]eymaps' },
  { key = '<leader>ss', fun = Snacks.picker.smart, desc = '[S]earch [S]mart' },
  { key = '<leader>st', fun = Snacks.picker.todo_comments, desc = '[S]earch [T]odos' },
  { key = '<leader>s:', fun = Snacks.picker.command_history, desc = '[S]earch [:]command history' },
  -- Lsp
  { key = 'grd', fun = Snacks.picker.lsp_definitions, desc = '[G]oto [D]efinition' },
  { key = 'grD', fun = Snacks.picker.lsp_declarations, desc = '[G]oto [D]eclaration' },
  { key = 'grr', fun = Snacks.picker.lsp_references, desc = '[G]oto [R]eferences' }, -- References Had `nowait = true` in example?
  { key = 'gri', fun = Snacks.picker.lsp_implementations, desc = '[G]oto [I]mplementation' },
  { key = 'grt', fun = Snacks.picker.lsp_type_definitions, desc = '[G]oto [T]ype definition' },
  { key = 'gO', fun = Snacks.picker.lsp_symbols, desc = 'Open Document Symbols' },
  { key = 'gW', fun = Snacks.picker.lsp_workspace_symbols, desc = 'Open Workspace Symbols' },
}

for _, search in ipairs(searches) do
  vim.keymap.set('n', search.key, function()
    search.fun()
  end, { desc = search.desc })
end
