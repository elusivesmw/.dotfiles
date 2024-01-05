-- in and out of insert
vim.keymap.set("i", "<C-c>", "<esc>")
vim.keymap.set("n", "<C-c>", "a")

-- prev/next buffers
vim.keymap.set("n", "<C-j>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>bp<cr>")

-- visually move selected lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- formatting
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- close buffer
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>")
-- easier write
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
