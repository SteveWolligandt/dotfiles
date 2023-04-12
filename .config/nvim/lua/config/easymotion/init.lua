local M = {}
local whichkey = require "which-key"
function M.setup()
  -- whichkey.register({
  --   f = { "<Plug>(easymotion-overwin-f)", 'Jump to character'  },
  --   l = { "<Plug>(easymotion-overwin-line)", 'Jump to line' },
  --   w = { "<Plug>(easymotion-overwin-w)", 'Jump to word' },
  -- }, { mode = "n", prefix = "<leader>" })
  --
  -- whichkey.register({
  --   f = { "<Plug>(easymotion-bd-f)", 'Jump to character' },
  --   l = { "<Plug>(easymotion-bd-jk)", 'Jump to line' },
  --   w = { "<Plug>(easymotion-bd-w)", 'Jump to word' },
  -- }, { mode = "", prefix = "<leader>" })
  vim.cmd [[
    " <leader>f{char} to move to {char}
    map  <leader>f <Plug>(easymotion-bd-f)
    nmap <leader>f <Plug>(easymotion-overwin-f)

    " Move to line
    map <leader>L <Plug>(easymotion-bd-jk)
    nmap <leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <leader>w <Plug>(easymotion-bd-w)
    nmap <leader>w <Plug>(easymotion-overwin-w)
  ]]
end
return M
