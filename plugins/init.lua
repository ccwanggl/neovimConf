local overrides = require("custom.plugins.configs.overrides")

local plugins = {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    event = "BufRead",
    config = function()
      require("mason-lspconfig").setup()
    end,
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
      require("nerdicons").setup({})
    end
  },
  {
    "glepnir/hlsearch.nvim",
    event = "BufRead",
    config = function()
      require("hlsearch").setup()
    end
  },
}

return plugins
