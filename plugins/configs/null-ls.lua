local get_os_name = require "custom.plugins.configs.get_os_name"
local os_name, arch_name = get_os_name.get_os_name()

local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
    -- webdev stuff
    formatting.deno_fmt,
    formatting.prettier,
    lint.eslint,

    -- Lua
    formatting.stylua,

    -- Shell
    formatting.shfmt,
    lint.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

    -- cpp
    formatting.clang_format,
    lint.cpplint,

    -- cmake
    formatting.cmake_format,
    lint.cmake_lint,

    -- golang
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
    -- misspelled word linter for Go comments, string literals and embedded files
    lint.golangci_lint,
    lint.staticcheck,
    lint.revive,

    -- csharp
    formatting.csharpier,

    -- python
    lint.mypy,
    lint.ruff,
    formatting.black,

    -- yaml
    lint.yamllint,
    formatting.yamlfmt,

    --markdown
    lint.vale.with({
        extra_filetypes = {"txt", "text"},
        extra_args = {"--config=%LOCALAPPDATA%\\vale\\.vale.ini"},
    })

}

if os_name == "Linux" then
    table.insert(sources, lint.gospel)
end


null_ls.setup ({
    -- add your sources / config options here
    debug = true,
    sources = sources,
})
