return {
  'sbdchd/neoformat',
  config = function()
    local whichkey = require "which-key"
    whichkey.register({
      g = {
        f = {'<cmd>:Neoformat<CR>', 'format full document'},
      }
    },{mode = 'n', remap=true})
    whichkey.register({
      g = {
        f = {"<cmd>:'<,'>Neoformat<CR>", 'format current selection'},
      }
    }, {mode = 'v', remap=true})
  end,
  opts = {},
  dependencies = {
    "folke/which-key.nvim",
  },
}
