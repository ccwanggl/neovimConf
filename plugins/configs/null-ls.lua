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
    lint.gospel,

    -- csharp
    formatting.csharpier,

    -- python
    lint.mypy,
    lint.ruff,
    formatting.black,

}

null_ls.setup {
    -- add your sources / config options here
    sources = sources,
    debug = true,
}
