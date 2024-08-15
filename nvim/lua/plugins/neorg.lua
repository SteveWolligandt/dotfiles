return {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  opts = {
    load = {
      ['core.defaults'] = {},
      ['core.neorgcmd'] = {},
      ['core.summary'] = {},
      ['core.journal'] = {},
      ['core.autocommands'] = {},
      ['core.export'] = {config={}},
      ['core.export.markdown'] = {config={}},
      ['core.integrations.treesitter'] = {config={}},
      ['core.ui'] = {},
      ['core.ui.calendar'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = '~/notes',
          },
          default_workspace='notes'
        }
      },
      ['core.qol.todo_items'] = {
        config = {
          create_todo_items = true,
          create_todo_parents = true,
        },
      },
      -- ['core.esupports.hop'] = {
      --   config = {}
      -- },
      ['core.concealer'] = {
        config={
          icons={
            code_block = {
              conceal=true,
            },
          },
        }
      },
      -- ['core.keybinds'] = {
      --   config = {}
      -- },
      -- ['core.presenter'] = {
      --   config = { zen_mode = 'zen-mode' }
      -- }
    }
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/zen-mode.nvim',
    'lukas-reineke/headlines.nvim',
  },
  build = ":Neorg sync-parsers",
  keys = {
    { '<leader>ni', "<cmd>Neorg index<cr>",   desc = "Open Index" },
    { '<leader>njt', "<cmd>Neorg journal today<cr>", desc = "Open Today's Journal" },
    { '<leader>njy', "<cmd>Neorg journal today<cr>", desc = "Open Yesterday's Journal" },
    { '<leader>nt', "<cmd>Neorg toc<cr>",     desc = "TOC" },
    { '<leader>nc', "<cmd>Neorg journal custom<cr>",     desc = "Open Calendar" },
  },
}
