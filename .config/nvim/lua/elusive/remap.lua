-- in and out of insert
vim.keymap.set("i", "<C-c>", "<esc>")
vim.keymap.set("n", "<C-c>", "a")

-- esc out of hlsearch
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- prev/next buffers
vim.keymap.set("n", "<C-j>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>bp<cr>")

-- toggle colorcolumn
vim.keymap.set("n", "<leader>cc", function()
    local cc = vim.o.colorcolumn
    if cc == "" then
        vim.o.colorcolumn = "81"
    else
        vim.o.colorcolumn = ""
    end
end)

-- delete/copy/paste
vim.keymap.set("v", "<leader>dd", [["_d]]) -- delete to void register
vim.keymap.set("v", "<leader>dp", [["_dP]]) -- delete to void register and paste

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank line or selection to clipboard register
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank line to clipboard register

vim.keymap.set("n", "<leader>p", [["+p]]) -- paste from clipboard register

-- visually move selected lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- close buffer
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>")
-- easier write
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
