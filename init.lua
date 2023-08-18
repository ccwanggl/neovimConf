-- used for override default options

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

if vim.g.neovide then
    vim.o.guifont = "MesloLGL Nerd Font:h14:b"
end
