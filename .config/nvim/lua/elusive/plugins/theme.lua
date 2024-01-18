return {
    {
        "folke/tokyonight.nvim",
        as = "tokyonight",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "storm",
            })
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
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        as = "moonfly",
        lazy = false,
        priority = 1000,
        config = function() end,
    },
    "nvim-tree/nvim-web-devicons",
}
