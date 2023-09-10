local present, neodev = pcall(require, "neodev")

if not present then
    print "neodev not found"
else
    neodev.setup {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    }
end
