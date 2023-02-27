local present, quarto = pcall(require, "quarto")

if not present then
  print "quarto not found"
  return
else
  quarto.setup {
    lspFeatures = {
      enabled = true,
      languages = { "r", "python", "julia" },
      chunks = "curly",
      diagnostics = {
        enabled = true,
        triggers = { "BufWrite" },
      },
      completion = {
        enabled = true,
      },
    },
  }
end
