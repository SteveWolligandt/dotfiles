return {
  'tpope/vim-fugitive',
  config = function()
    local whichkey = require "which-key"
    whichkey.add({
      { "<leader>g", group = "Git", nowait = false, remap = false },
      { "<leader>gb", "<cmd>:Git blame<CR>", desc = "git blame", nowait = false, remap = false },
      { "<leader>gc", "<cmd>:Git commit<CR>", desc = "git commit", nowait = false, remap = false },
      { "<leader>gd", "<cmd>:Gvdiff<CR>", desc = "git diff", nowait = false, remap = false },
      { "<leader>gg", "<cmd>:LazyGit<CR>", desc = "lazygit", nowait = false, remap = false },
      { "<leader>gh", group = "Hunk", nowait = false, remap = false },
      { "<leader>ghh", "<cmd>:Gitsigns preview_hunk<CR>", desc = "Previews Hunk", nowait = false, remap = false },
      { "<leader>ghn", "<cmd>:Gitsigns next_hunk<CR>", desc = "Jump to next Hunk", nowait = false, remap = false },
      { "<leader>ghp", "<cmd>:Gitsigns prev_hunk<CR>", desc = "Jump to previous Hunk", nowait = false, remap = false },
      { "<leader>ghs", "<cmd>:Gitsigns stage_hunk<CR>", desc = "Stage Hunk", nowait = false, remap = false },
      { "<leader>ghu", "<cmd>:Gitsigns reset_hunk<CR>", desc = "Undo Hunk", nowait = false, remap = false },
      { "<leader>gl", "<cmd>:Git log<CR>", desc = "git log", nowait = false, remap = false },
    })
  end,
  dependencies = {
    'folke/which-key.nvim',
  },
}
