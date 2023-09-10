local present, calc = pcall(require, "cmp-calc")

if not present then
    print "calc not found"
else
    require("cmp").setup {
        sources = {
            { name = "calc" },
        },
    }
end
