local M = {}
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "cpp",
    "python",
    "c_sharp",
    "markdown",
    "cmake",
    "markdown_inline",
    "rust",
    "go",
  },

  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
