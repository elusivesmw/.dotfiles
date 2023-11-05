require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = { prompt_position = "top" }
        },
        sorting_strategy = 'ascending',
    }
})
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-_>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', function ()
    require('telescope').extensions.file_browser.file_browser({
        path = '%:p:h',
        select_buffer = true
    })
    end, {})

vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

