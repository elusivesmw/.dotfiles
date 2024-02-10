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
                layout_strategy = "cursor",
                initial_mode = "normal",
                layout_config = {
                    width = 0.5,
                    height = 9,
                    preview_width = 0.5,
                },
            },
        },
    })
    vim.keymap.set("n", "<C-_>", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<C-g>", builtin.live_grep, {})

    vim.keymap.set("n", "<C-f>", function()
        builtin.find_files({
            find_command = find_command,
            cwd = utils.buffer_dir(),
            initial_mode = "normal",
            --prompt_title = "Find Files in Current Dir",
        })
    end, {})

    vim.keymap.set("n", "<leader>c", function()
        builtin.find_files({
            find_command = find_command,
            cwd = vim.fn.stdpath("config"),
            initial_mode = "normal",
        })
    end, {})

    vim.keymap.set("n", "<leader>fb", function()
        require("telescope").extensions.file_browser.file_browser({
            path = "%:p:h",
            select_buffer = true,
            initial_mode = "normal",
        })
    end, {})

    vim.keymap.set("n", "<leader>gf", function()
        builtin.git_files({ initial_mode = "normal" })
    end, {})
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
