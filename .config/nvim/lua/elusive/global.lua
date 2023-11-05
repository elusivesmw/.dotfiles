-- global feedkeys
Feedkeys = function(commands)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(commands,true,false,true),'n',true)
end

