local function config()
    local lsp_zero = require("lsp-zero")
    local cmp = require("cmp")
    local tele = require("telescope.builtin")

    lsp_zero.on_attach(function(client, bufnr)
        local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = bufnr, remap = false, desc = desc })
        end

        map("n", "gd", tele.lsp_definitions, "LSP [G]oto [D]efinition")
        map("n", "gr", tele.lsp_references, "LSP [G]oto [R]eferences")
        map("n", "gI", tele.lsp_implementations, "LSP [G]oto [I]mplementation")
        map("n", "<leader>D", tele.lsp_type_definitions, "LSP Type [D]efinition")
        map("n", "<leader>ds", tele.lsp_document_symbols, "LSP [D]ocument [S]ymbols")
        map("n", "<leader>ws", tele.lsp_dynamic_workspace_symbols, "LSP [W]orkspace [S]ymbols")
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP [R]e[n]ame")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP [C]ode [A]ction")
        map("n", "K", vim.lsp.buf.hover, "LSP Hover Documentation")
        map("n", "gD", vim.lsp.buf.declaration, "LSP [G]oto [D]eclaration")
        map({ "i", "n" }, "<C-h>", vim.lsp.buf.signature_help, "LSP [G]oto Signature [H]elp")

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

    local ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "ts_ls", "stylua" }
    require("mason").setup({})
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
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
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
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
