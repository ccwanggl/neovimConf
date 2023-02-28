return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  -- ["glepnir/dashboard-nvim"] = {
  --   disable = false,
  --   event = "VimEnter",
  --   config = function()
  --     require "custom.plugins.configs.dashboard"
  --   end,
  --
  --   requires = "nvim-tree/nvim-web-devicons",
  -- },

  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        -- "css-lsp",
        -- "html-lsp",
        -- "typescript-language-server",
        -- "deno",
        -- "emmet-ls",
        -- "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",

        -- cpp
        "clangd",
        "clang-format",
      },
    },
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    config = function()
      require "plugins.configs.treesitter"
      require "custom.plugins.configs.treesitter"
    end,
  },

  ["folke/todo-comments.nvim"] = {
    ft = { "lua", "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "vim", "tex" },
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "custom.plugins.configs.todo-comments"
    end,
  },

  ["folke/trouble.nvim"] = {
    ft = { "lua", "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "vim", "tex" },
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    event = "BufRead",
    config = function()
      require "custom.plugins.configs.lspsaga"
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      -- Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },

  ["folke/neodev.nvim"] = {},

  ["ggandor/leap.nvim"] = {
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
}
