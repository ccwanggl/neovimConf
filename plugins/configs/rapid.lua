local present, rapid = pcall(require, "rapid")

if not present then
  print "rapid not found"
else
  rapid.setup()
end
