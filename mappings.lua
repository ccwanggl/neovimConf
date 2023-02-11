local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "Escape insert mode", opts = { nowait = true } },
  },

  n = {
    [","] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
  },
}

return M
