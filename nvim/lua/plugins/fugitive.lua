return {
  'tpope/vim-fugitive',
  config = function()
    local whichkey = require "which-key"
    local keymap = {
      g = {
        name = 'Git',
        -- g = {'<cmd>:Git<CR>',        'git status'},
        c = {'<cmd>:Git commit<CR>', 'git commit'},
        l = {'<cmd>:Git log<CR>',    'git log'},
        g = {'<cmd>:LazyGit<CR>',    'lazygit'},
        d = {'<cmd>:Gvdiff<CR>',     'git diff'},
        b = {'<cmd>:Git blame<CR>',  'git blame'},
        h = {name = 'Hunk',
          h = {'<cmd>:Gitsigns preview_hunk<CR>',  'Previews Hunk'},
          n = {'<cmd>:Gitsigns next_hunk<CR>',  'Jump to next Hunk'},
          p = {'<cmd>:Gitsigns prev_hunk<CR>',  'Jump to previous Hunk'},
          u = {'<cmd>:Gitsigns reset_hunk<CR>',  'Undo Hunk'},
          s = {'<cmd>:Gitsigns stage_hunk<CR>',  'Stage Hunk'},
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
  end,
  dependencies = {
    'folke/which-key.nvim',
  },
}
