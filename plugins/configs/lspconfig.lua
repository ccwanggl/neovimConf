local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "emmet_ls", "clangd", "jsonls", "tsserver", "csharp_ls","cmake"}


for _, lsp in ipairs(servers) do
  if (lsp == "clangd") then
    capabilities.offsetEncoding={"utf-16"}
  end
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
