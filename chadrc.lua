local M = {}

local highlights = require "custom.highlights"

M.ui = {
    theme_toggle = { "onedark", "one_light" },
    theme = "chocolate",
    hl_override = highlights.override,
    hl_add = highlights.add,

    transparency = false,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
