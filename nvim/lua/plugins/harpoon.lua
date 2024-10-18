return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  opts = {},
  keys = {
    { '<leader>ha', function() require 'harpoon':list():add() end},
    { '<leader>ho', function() require 'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end},

    { '<C-1>', function() require 'harpoon':list():select(1) end},
    { '<C-2>', function() require 'harpoon':list():select(2) end},
    { '<C-3>', function() require 'harpoon':list():select(3) end},
    { '<C-4>', function() require 'harpoon':list():select(4) end},

    -- Toggle previous & next buffers stored within Harpoon list
    {'<C-S-P>', function() require 'harpoon':list():prev() end},
    {'<C-S-N>', function() require 'harpoon':list():next() end},
  },
}
