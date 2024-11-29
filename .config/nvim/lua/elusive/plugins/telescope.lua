local function config()
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    local find_command = { "rg", "--files", "--sort", "path" }

    require("telescope").setup({
        defaults = {
            layout_config = {
                horizontal = { prompt_position = "top", preview_width = 0.67 },
            },
            sorting_strategy = "ascending",
        },
        pickers = {
            find_files = {
                follow = true,
            },
            lsp_references = {
                theme = "ivy",
                initial_mode = "normal",
            },
        },
    })

    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })

    vim.keymap.set("n", "<leader><leader>", function()
        builtin.buffers({
            initial_mode = "normal",
        })
    end, { desc = "[ ] Search Buffers" })

    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })

    vim.keymap.set("n", "<leader>sf", function()
        builtin.find_files({
            find_command = find_command,
            cwd = utils.buffer_dir(),
            initial_mode = "normal",
        })
    end, { desc = "[S]earch [F]iles in current directory" })

    vim.keymap.set("n", "<leader>sc", function()
        builtin.find_files({
            find_command = find_command,
            cwd = vim.fn.stdpath("config"),
            initial_mode = "normal",
        })
    end, { desc = "[S]earch [C]onfig" })

    vim.keymap.set("n", "<leader>fb", function()
        require("telescope").extensions.file_browser.file_browser({
            path = "%:p:h",
            select_buffer = true,
            initial_mode = "normal",
        })
    end, { desc = "[F]ile [B]rowser" })

    vim.keymap.set("n", "<leader>gf", function()
        builtin.git_files({ initial_mode = "normal" })
    end, { desc = "Search [G]it [F]iles" })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                            , branch = '0.1.x',
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = config,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
}
