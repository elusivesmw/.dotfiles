local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 2 space tabs
augroup("setIndent", { clear = true })
autocmd("Filetype", {
    group = "setIndent",
    pattern = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.listchars:append({
            leadmultispace = "▏ ",
        })
    end,
})

-- 8 space tabs
autocmd("Filetype", {
    group = "setIndent",
    pattern = { "asm" },
    callback = function()
        vim.opt.tabstop = 8
        vim.opt.softtabstop = 8
        vim.opt.shiftwidth = 8
        vim.opt.listchars:append({
            leadmultispace = "▏       ",
        })
    end,
})
