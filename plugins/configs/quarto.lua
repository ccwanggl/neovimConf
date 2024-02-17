local present, quarto = pcall(require, "quarto")

if not present then
    print "quarto not found"
else
    quarto.setup()
end
