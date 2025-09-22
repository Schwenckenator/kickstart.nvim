-- This just enables the lsp
-- The config for the lsp lives in the 'lsp' folder
vim.lsp.enable 'lua_ls'

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      -- Add complete
      -- if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      --   vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      --   vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      --   vim.keymap.set('i', '<C-Space>', function()
      --     vim.lsp.completion.get()
      --   end)
      -- end

      -- Add normal-mode keymappings for signature help
      -- if client:supports_method 'textDocument/signatureHelp' then
      --   vim.keymap.set('n', '<C-s>', function()
      --     vim.lsp.buf.signature_help()
      --   end, { desc = 'Trigger lsp signature help' })
      -- end

      if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        vim.keymap.set('n', '<leader>th', function()
          local enabled = vim.lsp.inlay_hint.is_enabled()
          vim.print('Toggling Inlay hints ' .. (enabled and 'ON' or 'OFF'))
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = '[T]oggle Inlay [H]ints' })

        -- enable by default
        vim.lsp.inlay_hint.enable()
      end

      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = ev.buf,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = ev.buf,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end
  end,
})

vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- Set up typescript
require('typescript-tools').setup {
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = 'all',
    },
  },
}
