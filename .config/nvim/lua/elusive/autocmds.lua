local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 2 space tabs
augroup("setIndent", { clear = true })
autocmd("Filetype", {
    group = "setIndent",
    pattern = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
})

-- 8 space tabs
autocmd("Filetype", {
    group = "setIndent",
    pattern = { "asm" },
    command = "setlocal tabstop=8 softtabstop=8 shiftwidth=8 ",
})
