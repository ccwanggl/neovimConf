local get_os_name = require "custom.plugins.configs.get_os_name"
local os_name, arch_name = get_os_name.get_os_name()

local present, mason = pcall(require, "mason-null-ls")


if not present then
    print "mason-null-ls not found"
    return
else
end

local options={
    ensure_installed = {
        "stylua",
        "cpplint",
        "clang-format",
        "shellcheck",
        "csharpier",
        "cmakelang",
        "gofumpt",
        "golines",
        "mypy",
        "ruff",
        "black",
        "gospel",
        "goimports-reviser",
    },
}

if os_name == "Windows" then
    table.remove(options.ensure_installed, get_os_name.tablefind(options.ensure_installed, "gospel"))
elseif os_name == "Linux" then
    table.remove(options.ensure_installed, get_os_name.tablefind(options.ensure_installed, "csharpier"))
end

return options
