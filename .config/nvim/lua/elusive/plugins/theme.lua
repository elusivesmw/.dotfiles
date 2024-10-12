return {
    {
        "folke/tokyonight.nvim",
        as = "tokyonight",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "night",
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "catppuccin/nvim",
        as = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })
            --vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        as = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            --vim.cmd.colorscheme("moonfly")
        end,
    },
    "nvim-tree/nvim-web-devicons",
}
