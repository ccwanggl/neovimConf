local M = {}

M.ui = {
  theme = "aquarium",
}

M.plugins = {
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

return M
