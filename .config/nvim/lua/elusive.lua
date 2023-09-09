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


-- global feedkeys
feedkeys = function(commands)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(commands,true,false,true),'n',true)
end


-- get the char relative to the cursor
local curr_char = function(offset)
    if offset == nil then offset = 0 end
    local col  = vim.fn.col('.') + offset
    local line = vim.fn.getline('.')
    local char = string.sub(line, col, col)
    --print('\'' .. char .. '\'')
    return char
end


-- function
local mappings = {}
--fzf options
mappings.curr_buf = function()
    local opt = {
        sorting_strategy="ascending",
        layout_config={
            horizontal=
            {prompt_position="top"}
        }
    }
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

-- close parens
mappings.close = function(char)
    if curr_char() == char then
        feedkeys('<esc>la')
    else
        feedkeys(char)
    end
end

mappings.handle_cr = function()
    --local char = curr_char(0)
    --print(char .. ' - ' .. tostring(is_lbrace(char)))
    --local is_space = is_space(char)
end


return mappings
