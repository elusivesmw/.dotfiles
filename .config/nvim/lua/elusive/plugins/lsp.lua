return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
        end,
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "ts_ls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim", "nvim-cmp" },
        config = function()
            local lspconfig = require("lspconfig")
            local tele = require("telescope.builtin")

            local on_attach = function(client, bufnr)
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
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                -- ...
            })
        end,
    },
}
