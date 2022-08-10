local M = {}

M.ui = {
  theme = "chadtain",
}

M.plugins = {
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

return M
