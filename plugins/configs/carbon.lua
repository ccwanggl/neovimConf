local present, carbon = pcall(require, "carbon-now")

if not present then
    print "carbon-now not found"
else
    carbon.setup {
        options = {
            theme = "solarized",
            font_family = "Monoid",
        },
    }
end

vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true })
