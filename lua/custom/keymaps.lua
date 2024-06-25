-- ***************** --
-- My Custom Keymaps --
-- ***************** --

-- Worst place in the world??
vim.keymap.set('n', 'Q', '<nop>')

-- Centre page on page jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = '1/2 page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = '1/2 page up' })

-- Centre page on search jumps
vim.keymap.set('n', 'n', 'nzz', { desc = '[N]ext search' })
vim.keymap.set('n', 'N', 'Nzz', { desc = '[N] previous search' })

-- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = '[J] Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = '[K] Move line up' })

-- Join lines without moving cursor
vim.keymap.set('n', 'J', 'mzJ`z', { desc = '[J]oin line' })

-- Delete to void (don't cut)
vim.keymap.set({ 'n', 'v' }, '_d', '"_d', { desc = '[_] Void [D]elete' })
vim.keymap.set({ 'n', 'v' }, '_D', '"_D', { desc = '[_] Void [D]elete' })
vim.keymap.set({ 'n', 'v' }, '_c', '"_c', { desc = '[_] Void [C]hange' })
vim.keymap.set({ 'n', 'v' }, '_C', '"_C', { desc = '[_] Void [C]hange' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = '[Y]ank to clipboard' })

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p', { desc = '[P]aste after from clipboard' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = '[P]aste before from clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = '[P]aste from clipboard' })
vim.keymap.set('v', '<leader>P', '"+P', { desc = '[P]aste w/o cutting from clipboard' })

-- Paste from most recent yank
vim.keymap.set({ 'n', 'v' }, '<leader>0', '"0p', { desc = 'Paste yank [0]' })
vim.keymap.set({ 'n', 'v' }, '<leader>)', '"0P', { desc = 'Paste yank [0]' })

-- Create jsdoc-style comments
vim.keymap.set('n', 'gjl', 'o/**  */<Esc>2hi', { desc = '[J]sdoc [L]ine comment below' })
vim.keymap.set('n', 'gjL', 'O/**  */<Esc>2hi', { desc = '[J]sdoc [L]ine comment above' })
vim.keymap.set('v', 'gjl', 'c/**  */<Esc>2hP', { desc = '[J]sdoc [L]ine comment' })

vim.keymap.set('n', 'gjr', '0"jC{/**  */}<Esc>3h"jP', { desc = '[J]s [R]eact comment' })
vim.keymap.set('v', 'gjr', '"jc{/**  */}<Esc>3h"jP', { desc = '[J]s [R]eact comment' })

vim.keymap.set('n', 'gjb', 'O/**<CR><CR>/<Esc>ka ', { desc = '[J]sdoc [B]lock comment' })
vim.keymap.set('v', 'gjb', 'O/**<CR><CR>/<Esc>ka ', { desc = '[J]sdoc [B]lock comment' })

-- File Keymaps
vim.keymap.set('n', '<leader>fs', vim.cmd.w, { desc = '[F]ile [S]ave' })
vim.keymap.set('n', '<leader>fS', vim.cmd.wa, { desc = '[F]ile [S]ave all' })

vim.keymap.set('n', '<leader>fe', '<CMD>Oil<CR>', { desc = '[F]ile [E]xplorer' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = '[F]ile [E]xplorer' })

vim.keymap.set('n', '<leader>fr', '<CMD>w<CR><CMD>e<CR>', { desc = '[F]ile [R]eload' })
vim.keymap.set('n', '<leader>fR', '<CMD>e!<CR>', { desc = '[F]ile force [R]eload' })

-- Code Keymaps
vim.keymap.set('n', '<leader>cx', '<CMD>EslintFixAll<CR>', { desc = '[C]ode Fi[x]' })
vim.keymap.set('n', '<leader>cia', '<CMD>TSToolsAddMissingImports<CR>', { desc = '[C]ode [I]mport [A]dd' })
vim.keymap.set('n', '<leader>cir', '<CMD>TSToolsRemoveUnusedImports<CR>', { desc = '[C]ode [I]mport [R]emove' })

-- Insert/Append at current indent on empty lines
local function indentOnEmpty(defaultMap)
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or defaultMap
end

vim.keymap.set('n', 'i', function()
  return indentOnEmpty 'i'
end, { expr = true, noremap = true, desc = '[I]nsert' })
vim.keymap.set('n', 'a', function()
  return indentOnEmpty 'a'
end, { expr = true, noremap = true, desc = '[A]ppend' })

local function surround(lhs, rhs)
  local mode = vim.api.nvim_get_mode()
  if mode.mode == 'v' then
    return '"sc' .. lhs .. rhs .. '<Esc>"sP'
  elseif mode.mode == 'V' then
    return '"sc' .. lhs .. '<CR>' .. rhs .. '<Esc>"sPvi' .. lhs .. '>'
  else
    print 'block surround'
    return '"sc' .. lhs .. rhs .. '<Esc>"sP'
  end
end

local surroundList = {
  { lhs = '(', rhs = ')' },
  { lhs = '[', rhs = ']' },
  { lhs = '{', rhs = '}' },
  { lhs = '<', rhs = '>' },
  { surr = "'" },
  { surr = '"' },
  { surr = '`' },
}

for key, value in pairs(surroundList) do
  if value['lhs'] ~= nil and value['rhs'] ~= nil then
    local lhs = value['lhs']
    local rhs = value['rhs']

    vim.keymap.set('v', 's' .. lhs, function()
      return surround(lhs, rhs)
    end, { expr = true, noremap = true, desc = '[S]urround with ' .. lhs .. rhs })
    vim.keymap.set('v', 's' .. rhs, function()
      return surround(lhs, rhs)
    end, { expr = true, noremap = true, desc = '[S]urround with ' .. lhs .. rhs })
  end
  if value['surr'] ~= nil then
    local surr = value['surr']
    vim.keymap.set('v', 's' .. surr, function()
      return surround(surr, surr)
    end, { expr = true, noremap = true, desc = '[S]urround with ' .. surr .. surr })
  end
end
