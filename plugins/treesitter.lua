local ok, treesitter = pcall(require,'nvim-treesitter.install')

if not ok then 
  print("nvim-treesitter not found")
else
  treesitter.compilers = {"clang"}
end
