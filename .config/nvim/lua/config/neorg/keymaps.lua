local M = {}
local whichkey = require "which-key"

M.setup = function()
  local keymap = {
    n = {
      name = "Neorg",
      i = { "<cmd>Neorg index<cr>", "Open Index" },
      j = { "<cmd>Neorg journal<cr>", "Journal" },
    },
  }

  whichkey.register(keymap, {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })
end

return M
