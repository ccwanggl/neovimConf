local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "Escape insert mode", opts = { nowait = true } },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.formatting()
      end,
      "   lsp formatting",
    },
  },
}

return M
