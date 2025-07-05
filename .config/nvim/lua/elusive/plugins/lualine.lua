local function config()
    require("lualine").setup({
      sections = {
        lualine_c = {
          'filename',
          {
              require('noice').api.statusline.mode.get,
              cond = require('noice').api.statusline.mode.has,
              color = { ff = "ff9e64" }
          }
        }
      }
    })
end

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = config,
    },
}
