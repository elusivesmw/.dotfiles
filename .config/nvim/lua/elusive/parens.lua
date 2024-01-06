require("elusive.global")

-- get the char relative to the cursor
local curr_char = function(offset)
    if offset == nil then
        offset = 0
    end
    local col = vim.fn.col(".") + offset
    local line = vim.fn.getline(".")
    local char = string.sub(line, col, col)
    --print('\'' .. char .. '\'')
    return char
end

-- close parens
local close = function(char)
    if curr_char() == char then
        Feedkeys("<esc>la")
    else
        Feedkeys(char)
    end
end

-- keymaps
vim.keymap.set("i", "(", "()<esc>ha", {})
vim.keymap.set("i", ")", function()
    close(")")
end, {})

vim.keymap.set("i", "{", "{}<esc>ha", {})
vim.keymap.set("i", "}", function()
    close("}")
end, {})

vim.keymap.set("i", "[", "[]<esc>ha", {})
vim.keymap.set("i", "]", function()
    close("]")
end, {})
