return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    config = {
      -- shortcut = {
      --   {
      --     desc = 'Jira',
      --     -- action = function()
      --     --   vim.cmd('exec ":!open https://jira.cd-adapco.com"')
      --     -- end,
      --   },
      -- },
      packages = {
        enable = true -- show how many plugins neovim loaded
      },
      -- limit how many projects list, action when you press key or enter it will run this action.
      -- action can be a functino type, e.g.
      -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
      project = {
        enable = true,
        -- limit = 8,
        -- icon = 'your icon',
        -- label = '',
        -- action = 'Telescope find_files cwd='
      },
      mru = { -- most recent files used
        -- limit = 10,
        -- label = '',
      },
      footer = {}, -- footer
      week_header = {
        enable = true, --boolean use a week header
        -- concat = true, --concat string after time string line
        -- append = true, --table append after time string line
      },
      disable_move = false  -- boolean default is false disable move key
    }
  },
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
