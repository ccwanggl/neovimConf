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
        enable = false,
    },

    renderer = {
        highlight_git = false,
        icons = {
            show = {
                git = false,
            },
        },
    },
}

return M
