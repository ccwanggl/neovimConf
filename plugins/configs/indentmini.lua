local present, indentmini = pcall(require, "indentmini")

if not present then
  print "indentmini not found"
else
  indentmini.setup {
    char = "|",
    exclude = {
      "erlang",
      "markdown",
    },
  }
  vim.cmd.highlight "default link IndentLine Comment"
end
