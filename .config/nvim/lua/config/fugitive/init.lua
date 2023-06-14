local M = {}
local whichkey = require "which-key"
function M.setup()
  local keymap = {
    g = {
      name = 'Git',
      g = {'<cmd>:Git<CR>',        'git status'},
      c = {'<cmd>:Git commit<CR>', 'git commit'},
      l = {'<cmd>:Git log<CR>',    'git log'},
      L = {'<cmd>:LazyGit<CR>',    'lazygit'},
      d = {'<cmd>:Gdiff<CR>',      'git diff'},
      b = {'<cmd>:Git blame<CR>',  'git blame'},
      h = {name = 'Hunk',
        h = {'<cmd>:GitGutterPreview<CR>',  'Previews Hunk'},
        n = {'<cmd>:GitGutterNextHunk<CR>',  'Jump to next Hunk'},
        p = {'<cmd>:GitGutterPrevHunk<CR>',  'Jump to previous Hunk'},
        u = {'<cmd>:GitGutterUndoHunk<CR>',  'Undo Hunk'},
        s = {'<cmd>:GitGutterStageHunk<CR>',  'Stage Hunk'},
      },
    }
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
