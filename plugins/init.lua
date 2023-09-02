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
        
        opts = function()
            return require "custom.plugins.configs.mason-lspconfig"
        end,

        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    -- NOTE:use mason-null-ls to configure Formatter/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        event = "BufRead",
        opts = function()
            return require "custom.plugins.configs.mason-null-ls"
        end,

        config = function(_, opts)
            require("mason-null-ls").setup(opts)
        end,
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "BufRead",
        opts = {
            ensure_installed = {
                -- "python",
                "codelldb",
                "go-debug-adapter",
                "debugpy",
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
        event = "VeryLazy",
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.configs.null-ls"
        end,
    },

    {
        "folke/neodev.nvim",
        ft = "lua",
        config = function()
            require "custom.plugins.configs.neodev"
        end,
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
        event = "BufRead",
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
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "custom.plugins.configs.rust-tools"
        end,

        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings "dap"
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings "dap_go"
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path = "~/AppData/Local/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe"
            require("dap-python").setup(path)
            require("core.utils").load_mappings "dap_python"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings "gopher"
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
    {
        "saecki/crates.nvim",
        dependencies = "hrsh7th/nvim-cmp",
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crates = require "crates"
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "plugins.configs.cmp"
            table.insert(M.sources, { name = "crates" })
            return M
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "NeogitOrg/neogit",
        event = "BufRead",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        config = true,
    },
    {
        "aznhe21/actions-preview.nvim",
        event = "BufEnter",
        config = function()
            require "custom.plugins.configs.action-preview"
        end,
    },
    {
        "hrsh7th/cmp-calc",
        event = "BufEnter",
        config = function()
            require "custom.plugins.configs.calc"
        end,
    },

    {
        "andrewferrier/debugprint.nvim",
        event = "BufEnter",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "ellisonleao/carbon-now.nvim",
        lazy = true,
        cmd = "CarbonNow",
        config = function()
            require "custom.plugins.configs.carbon"
        end,
    },
}

return plugins
