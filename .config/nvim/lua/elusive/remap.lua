vim.g.mapleader = " "

-- prev/next buffers
vim.keymap.set("n", "<C-j>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>bp<cr>")

-- visually move selected lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

