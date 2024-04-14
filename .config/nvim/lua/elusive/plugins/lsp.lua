local function config()
    local lsp_zero = require("lsp-zero")
    local cmp = require("cmp")
    local tele = require("telescope.builtin")

    lsp_zero.on_attach(function(client, bufnr)
        local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = bufnr, remap = false, desc = desc })
        end

        map("n", "gd", tele.lsp_definitions, "[G]oto [D]efinition")
        map("n", "gr", tele.lsp_references, "[G]oto [R]eferences")
        map("n", "gI", tele.lsp_implementations, "[G]oto [I]mplementation")
        map("n", "<leader>D", tele.lsp_type_definitions, "Type [D]efinition")
        map("n", "<leader>ds", tele.lsp_document_symbols, "[D]ocument [S]ymbols")
        map("n", "<leader>ws", tele.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map({ "i", "n" }, "<C-h>", vim.lsp.buf.signature_help, "[G]oto Signature [H]elp")

        -- autocmd for highlighting lsp references
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end)

    require("mason").setup({})
    require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "tsserver" },
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require("lspconfig").lua_ls.setup(lua_opts)
            end,
        },
    })

    cmp.setup({
        sources = {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        }),
    })
end

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
        config = config,
    },
}
