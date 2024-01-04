local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies= { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'nvim-treesitter/playground',
    'tpope/vim-fugitive',
    'mbbill/undotree',
    -- Theme
    { "catppuccin/nvim", as = "catppuccin" },
    { "bluz71/vim-moonfly-colors", as = "moonfly" },
    'nvim-tree/nvim-web-devicons',
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            require("null-ls").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    }

}
require("lazy").setup(plugins)

