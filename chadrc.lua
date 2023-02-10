local M = {}

M.ui = {
  theme = "ayu-dark",
}

M.plugins = {
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

return M
