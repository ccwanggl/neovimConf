local get_os_name = require "custom.plugins.configs.get_os_name"
local os_name, arch_name = get_os_name.get_os_name()

local present, mason = pcall(require, "mason-nvim-dap")

if not present then
    print('mason-nvim-dap not found')
    return
else
end

local options = {
    ensure_installed = {
        'python',
        'cppdbg',
        'js',
        'bash',
    },
    
    automatic_installation = true,
}

-- if os_name == "Linux" then
--     table.remove(options.ensure_installed, get_os_name.tablefind(options.ensure_installed, "csharp_ls"))
-- end

return options
