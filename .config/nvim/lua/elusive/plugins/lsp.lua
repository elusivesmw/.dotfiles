local function config ()
    local lsp_zero = require('lsp-zero')
    local cmp = require('cmp')
    local tele = require('telescope.builtin')

    lsp_zero.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
      vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
      vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
      vim.keymap.set('n', 'gr', function() tele.lsp_references() end, opts)
      vim.keymap.set({'i', 'n'}, '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
      vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)

      vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)

    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {'tsserver', 'rust_analyzer', 'lua_ls'},
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      }
    })

    cmp.setup({
      sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
      },
      formatting = lsp_zero.cmp_format(),
      mapping = cmp.mapping.preset.insert({
        ['<Space>'] = cmp.mapping.confirm({ select = false }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })
end

return {
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
        },
        config = config
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            require("null-ls").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}

