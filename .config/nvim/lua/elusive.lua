--local lspconfig = require('lspconfig')
--lspconfig.tsserver.setup {}

local action_state = require('telescope.actions.state')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                --["<c-s>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            } 
        }
    }
}
require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')

-- function
local mappings = {}
mappings.curr_buf = function()
    local opt = {
        sorting_strategy="ascending",
        layout_config={
            horizontal=
            {prompt_position="bottom"}
        }
    }
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return mappings
