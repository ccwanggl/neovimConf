local M = {}

M.ui = {
  theme = "gruvbox_material",
}

M.plugins = {
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

return M
