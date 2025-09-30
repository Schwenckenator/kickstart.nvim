-- Formatting

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 1000, lsp_fallback = true }
  end,
  default_format_opts = {
    stop_after_first = true,
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    javascript = { 'prettierd', 'prettier' },
    typescript = { 'prettierd', 'prettier' },
    javascriptreact = { 'prettierd', 'prettier' },
    typescriptreact = { 'prettierd', 'prettier' },
    json = { 'prettierd', 'prettier' },
    templ = { 'templ' },
    gdscript = { 'gdformat' },
  },
}

-- Auto commands
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, { desc = 'Disable auto-format on save', bang = true })

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, { desc = 'Enable auto-format on save' })

vim.api.nvim_create_user_command('FormatToggle', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  local msg = ''
  if vim.g.disable_autoformat then
    msg = 'Format on save disabled!'
  else
    msg = 'Format on save enabled!'
  end
  vim.print(msg)
end, { desc = 'Toggles auto-format on save' })

-- Keymaps
vim.keymap.set('n', '<leader>tf', '<CMD>FormatToggle<CR>', { desc = 'Toggle auto-format' })
