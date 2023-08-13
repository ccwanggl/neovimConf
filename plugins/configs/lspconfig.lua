local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local configs = require "lspconfig.configs"
local nvim_lsp = require "lspconfig"
local servers = {
    "html",
    "cssls",
    "emmet_ls",
    "clangd",
    "jsonls",
    "tsserver",
    "csharp_ls",
    "lua_ls",
    "pyright",
    "rust_analyzer"
}

for _, lsp in ipairs(servers) do
    if lsp == "clangd" then
        capabilities.offsetEncoding =  "utf-16"
        
        nvim_lsp[lsp].setup {
            on_attach = function (client, bufnr)
                client.server_capabilities.signatureHelpProvider = false
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
        }
    else
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end
end

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
