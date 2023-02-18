return {

  ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.configs.lspconfig"
      end,
    },

  ["nvim-treesitter/nvim-treesitter"] = {
      config = function()
        require "plugins.configs.treesitter"
        require "custom.plugins.configs.treesitter"
      end,
  },

  ["folke/todo-comments.nvim"] = {
    opt = true,
    ft = {'lua','sh','zsh','bash','c','cpp','cmake','html','markdown', 'vim', 'tex'},
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "custom.plugins.configs.todo-comments"
    end,
  },

  ["folke/trouble.nvim"] = {
    opt = true,
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
    config = function()
      require "custom.plugins.configs.lspsaga"
    end,
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      -- Please make sure you install markdown and markdown_inline parser
      --{"nvim-treesitter/nvim-treesitter"}
    },
  },
  
   -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
}
