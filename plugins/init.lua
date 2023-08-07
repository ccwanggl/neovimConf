local overrides = require "custom.plugins.configs.overrides"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  -- NOTE:use mason-lspconfig to configure LSP installation
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufRead",
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
        "neocmake",
        "bashls",
        "powershell_es",
        "csharp_ls",
      },
    },
  },
  -- NOTE:use mason-null-ls to configure Formatter/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    event = "BufRead",
    opts = {
      ensure_installed = {
        "stylua",
        "cpplint",
        "clang-format",
        "shell-check",
        "csharpier",
        "cmakelang",
        -- "luacheck",
      },
    },
  },

  {
    event = "BufRead",
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        -- "python",
        "codelldb",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "folke/todo-comments.nvim",
    ft = { "lua", "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "vim", "tex" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "custom.plugins.configs.todo-comments"
    end,
  },

  {
    "folke/trouble.nvim",
    ft = { "lua", "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "vim", "tex" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require "custom.plugins.configs.lspsaga"
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- format & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufRead",
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },

  {
    "folke/neodev.nvim",
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",

    config = function()
      require "custom.plugins.configs.wilder"
    end,
  },
  {
    "glepnir/nerdicons.nvim",
    cmd = "NerdIcons",
    config = function()
      require("nerdicons").setup {}
    end,
  },
  {
    "glepnir/hlsearch.nvim",
    event = "BufRead",
    config = function()
      require("hlsearch").setup()
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    config = function()
      require("dropbar").setup()
    end,
  },
  {
    "chrisgrieser/nvim-recorder",
    opts = {},
  },
  {
    "nyngwang/NeoZoom.lua",
    event = "BufRead",
    config = function()
      require("neo-zoom").setup()
    end,
  },
  {
    "nvimdev/rapid.nvim",
    lazy = false,
    config = function()
      require("rapid").setup()
    end,
  },
  {
    "nvimdev/indentmini.nvim",
    event = "BufEnter",
    config = function()
      require("indentmini").setup()
    end,
  },
}

return plugins
