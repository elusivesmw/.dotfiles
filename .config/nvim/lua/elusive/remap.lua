-- in and out of insert
vim.keymap.set("i", "<C-c>", "<esc>")
vim.keymap.set("n", "<C-c>", "a")

-- prev/next buffers
vim.keymap.set("n", "<C-j>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>bp<cr>")

-- delete/copy/paste
vim.keymap.set("v", "<leader>dd", [["_d]]) -- delete to void register
vim.keymap.set("v", "<leader>dp", [["_dP]]) -- delete to void register and paste

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank line or selection to clipboard register
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank line to clipboard register

vim.keymap.set("n", "<leader>p", [["+p]]) -- paste from clipboard register

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
