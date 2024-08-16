return {
  'sbdchd/neoformat',
  config = function()
    local whichkey = require "which-key"
    whichkey.add({
      { "gf", "<cmd>:Neoformat<CR>", desc = "format full document", remap = true },
    })
    whichkey.add({
      { "gf", "<cmd>:'<,'>Neoformat<CR>", desc = "format current selection", mode = "v", remap = true },
    })
  end,
  opts = {},
  dependencies = {
    "folke/which-key.nvim",
  },
}
