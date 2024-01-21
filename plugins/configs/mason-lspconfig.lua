local get_os_name = require "custom.plugins.configs.get_os_name"
local os_name, arch_name = get_os_name.get_os_name()

local present, mason = pcall(require, "mason-lspconfig")
local options

if not present then
    print "mason-lspconfig not found"
    return
else
end

local ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "neocmake",
    "bashls",
    "powershell_es",
    "csharp_ls",
    "rust_analyzer",
    "gopls",
    "marksman",
    "eslint-lsp",
    "js-debug-adapter",
    "prettier",
    "typescript-language-server",
    "slint-lsp"
}

if os_name == "Linux" then
    table.remove(ensure_installed, get_os_name.tablefind(ensure_installed, "csharp_ls"))
end

return options
