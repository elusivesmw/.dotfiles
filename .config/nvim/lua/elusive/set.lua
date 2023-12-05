vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 10

vim.opt.swapfile = false
vim.opt.undofile = true
-- vim.opt.undodir = os.getenv("HOME") .."/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.list = true
vim.opt.listchars:append {
    tab = ">·",
    trail = "·",
}

vim.opt.termguicolors = true
vim.cmd.colorscheme "moonfly"

