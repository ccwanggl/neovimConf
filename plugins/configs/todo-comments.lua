local present, todo = pcall(require, "todo-comments")

if not present then
  print "todo-comments not found"
else
  todo.setup ()
end
