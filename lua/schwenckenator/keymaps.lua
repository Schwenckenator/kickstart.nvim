-- ***************** --
-- My Custom Keymaps --
-- ***************** --

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- vim.keymap.set('v', 'J', ":m '>+" .. vim.v.count + 1 .. '<CR>gv=gv', { desc = '[J] Move line down' })
-- vim.keymap.set('v', 'K', ":m '<-" .. vim.v.count + 2 .. '<CR>gv=gv', { desc = '[K] Move line up' })

-- Join lines without moving cursor
vim.keymap.set('n', 'J', 'mzJ`z', { desc = '[J]oin line' })

-- Delete to void (don't cut)
vim.keymap.set({ 'n', 'v' }, '_d', '"_d', { desc = '[_] Void [D]elete' })
vim.keymap.set({ 'n', 'v' }, '_D', '"_D', { desc = '[_] Void [D]elete' })
vim.keymap.set({ 'n', 'v' }, '_c', '"_c', { desc = '[_] Void [C]hange' })
vim.keymap.set({ 'n', 'v' }, '_C', '"_C', { desc = '[_] Void [C]hange' })
vim.keymap.set({ 'n', 'v' }, '_x', '"_x', { desc = '[_] Void [D]elete' })

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
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'File Explorer' })

-- Code Keymaps
vim.keymap.set('n', '<leader>cx', '<CMD>EslintFixAll<CR>', { desc = '[C]ode Fi[x]' })
vim.keymap.set('n', '<leader>cia', '<CMD>TSToolsAddMissingImports<CR>', { desc = '[C]ode [I]mport [A]dd' })
vim.keymap.set('n', '<leader>cir', '<CMD>TSToolsRemoveUnusedImports<CR>', { desc = '[C]ode [I]mport [R]emove' })

-- Toggle Case
-- vim.keymap.set({ 'n', 'v' }, '<leader>ccc', '<CMD>s/[a-z]\\@<=[A-Z]/_\\l\0/g<CR>', { desc = '[C]ode [C]ase [C]amel' })
-- vim.keymap.set('n', '<leader>ccs', '<CMD>s/[a-z]\\@<=[A-Z]/_\\l\0/g<CR>', { desc = '[C]ode [C]ase [S]nake' })
-- vim.keymap.set('v', '<leader>ccs', "<CMD>'<,'>s/[a-z]\\@<=[A-Z]/_\\l\0/g<CR>", { desc = '[C]ode [C]ase [S]nake' })

-- Reload config keymaps
vim.keymap.set(
  'n',
  '<leader><leader>rs',
  '<CMD>source ~/.config/nvim/lua/schwenckenator/config/luasnip.lua<CR>',
  { desc = '[R]eload [S]nippets', noremap = true, silent = true }
)

-- Insert/Append at current indent on empty lines
local function indentOnEmpty(defaultMap)
  -- `cc` copys blank line or spaces into yank register
  -- send the blank spaces to the void with `"_cc`
  return string.match(vim.api.nvim_get_current_line(), '^%s*$') ~= nil and '"_cc' or defaultMap
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
    return '"sc' .. lhs .. '<CR>' .. rhs .. '<Esc>"sPV>'
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
  { surr = '_' },
  { surr = '-' },
  { surr = '*' },
  { surr = '=' },
  { surr = '/' },
  { surr = '|' },
}

for _, value in pairs(surroundList) do
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

require 'schwenckenator.search'

vim.keymap.set({ 'n', 't' }, '<leader>tt', '<CMD>Floaterminal<CR>')
