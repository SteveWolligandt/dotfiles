local M = {}
local whichkey = require "which-key"
function M.setup()
  vim.cmd [[
    nnoremap gf :Neoformat <CR>
    vnoremap gf :Neoformat <CR>
  ]]
  -- whichkey.register({
  --   g = {
  --     f = {'<cmd>:Neoformat<CR>', 'format full document'},
  --   }
  -- },{mode = 'n', remap=true})
  -- whichkey.register({
  --   g = {
  --     f = {"<cmd>:'<,'>Neoformat<CR>", 'format current selection'},
  --   }
  -- }, {mode = 'v', remap=true})
end
return M
