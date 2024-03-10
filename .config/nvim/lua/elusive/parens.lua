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
local close_parens = function(char)
    if curr_char() == char then
        Feedkeys("<esc>la")
    else
        Feedkeys(char)
    end
end

-- if enter is pressed between {}, open a newline in between
local cr_parens = function()
    if
        (curr_char(-1) == "(" and curr_char() == ")")
        or (curr_char(-1) == "{" and curr_char() == "}")
        or (curr_char(-1) == "[" and curr_char() == "]")
    then
        Feedkeys("<cr><esc>O")
    else
        Feedkeys("<cr>")
    end
end

-- keymaps
vim.keymap.set("i", "(", "()<esc>ha", {})
vim.keymap.set("i", ")", function()
    close_parens(")")
end, {})

vim.keymap.set("i", "{", "{}<esc>ha", {})
vim.keymap.set("i", "}", function()
    close_parens("}")
end, {})

vim.keymap.set("i", "[", "[]<esc>ha", {})
vim.keymap.set("i", "]", function()
    close_parens("]")
end, {})

vim.keymap.set("i", "<cr>", function()
    cr_parens()
end, {})
