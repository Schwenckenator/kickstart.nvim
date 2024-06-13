-- Checks if we are in a godot project, and if so, begins to listen on ./godothost
local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
if gdproject then
  io.close(gdproject)
  vim.fn.serverstart './godothost'
end

-- vim.lsp.set_log_level 'debug'
