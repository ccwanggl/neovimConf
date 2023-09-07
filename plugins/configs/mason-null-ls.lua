local get_os_name = require "custom.plugins.configs.get_os_name"
local os_name, arch_name = get_os_name.get_os_name()

local present, mason = pcall(require, "mason-null-ls")
local options

if not present then
    print "mason-null-ls not found"
    return
else
end

local ensure_installed = {
    "stylua",
    "cpplint",
    "clang-format",
    "shell-check",
    "csharpier",
    "cmakelang",
    "gofumpt",
    "goimports_reviser",
    "golines",
    "mypy",
    "ruff",
    "black",
    "gospel",
}

if os_name == "Windows" then
    table.remove(ensure_installed, get_os_name.tablefind(ensure_installed, "gospel"))
    options = {
        ensure_installed = ensure_installed,
    }
elseif os_name == "Linux" then
    table.remove(ensure_installed, get_os_name.tablefind(ensure_installed, "csharpier"))
end

return options
