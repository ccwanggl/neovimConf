local get_os_name = require "custom.plugins.configs.get_os_name"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local nvim_lsp = require "lspconfig"
local configs = require "lspconfig/configs"
local util = require "lspconfig/util"

local servers = {
    "html",
    "cssls",
    "emmet_ls",
    "clangd",
    "jsonls",
    "tsserver",
    "csharp_ls",
    "lua_ls",
    "rust_analyzer",
    "marksman",
    "slint_lsp",
    "yamlls"
}

if os_name == "Linux" then
    table.remove(servers, get_os_name.tablefind(servers, "csharp_ls"))
end

for _, lsp in ipairs(servers) do
    if lsp == "clangd" then
        capabilities.offsetEncoding = { "utf-16" }
        on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
            on_attach(client, bufnr)
        end
    end
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

--NOTE: configuration for gopls
nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetype = { "go", "gomod", "gowork", "gotoml" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
			}
		};
	}
end

nvim_lsp.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}

--NOTE: configuration for pyright
nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetype = { "python" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}

--NOTE: configuration for neocmakelsp
if not configs.neocmake then
    configs.neocmake = {
        default_config = {
            cmd = { "neocmakelsp", "--stdio" },
            filetypes = { "cmake" },
            root_dir = function(fname)
                return nvim_lsp.util.find_git_ancestor(fname)
            end,
            single_file_support = true, -- suggested
            on_attach = on_attach, -- on_attach is the on_attach function you defined
        },
    }
    nvim_lsp.neocmake.setup {}
end

--NOTE: Only for neodev configuration
require("neodev").setup {}

-- NOTE: nodejs
local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
    }
    vim.lsp.buf.execute_command(params)
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
        },
    },
}
nvim_lsp.slint_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetype = { "slint" },
}
