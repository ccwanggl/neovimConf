local present, _ = pcall(require, "mason-nvim-dap")

if not present then
    print('mason-nvim-dap not found')
    return
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

return options
