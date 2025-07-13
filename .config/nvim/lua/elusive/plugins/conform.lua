local function config()
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            -- python = { "isort", "black" },
            -- Use a sub-list to run only the first available formatter
            javascript = { "prettierd", "prettier" },
            javascriptreact = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            typescriptreact = { "prettierd", "prettier" },
        },
        format_on_save = {
            timeout = 500,
            lsp_fallback = true,
        },
    })
end

return {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {},
    config = config,
}
