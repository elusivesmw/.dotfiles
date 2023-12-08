require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = { prompt_position = "top" }
        },
        sorting_strategy = 'ascending',
    },
    pickers = {
        find_files = {
            follow = true
        }
    }
})
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-_>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

-- TODO: get find files relative to current buffer working dir
vim.keymap.set('n', '<C-f>', function()
    builtin.find_files({
        initial_mode = 'normal'
    })
    end, {})

vim.keymap.set('n', '<leader>c', function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, {})

vim.keymap.set('n', '<leader>fb', function ()
    require('telescope').extensions.file_browser.file_browser({
        path = '%:p:h',
        select_buffer = true,
        initial_mode = 'normal'
    })
    end, {})

vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

