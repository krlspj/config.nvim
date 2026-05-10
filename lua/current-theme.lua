-- Theme state manager
-- Allows switching themes programmatically

local M = {}

M.apply = function()
  -- Default theme from your initial setup
  vim.cmd.colorscheme 'tokyonight-night'
end

return M
