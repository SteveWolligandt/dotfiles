return {
  "nvim-neorg/neorg",
  -- version = "*",
  lazy = false,
  -- config = true,
  opts = {
    load = {
      ['core.defaults'] = {},
      ['core.completion'] = {
        config = {
          engine = "nvim-cmp",
        },
      },
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
            general     = "G:/My Drive/Neorg/general",
            juice_detox = "G:/My Drive/Neorg/juice_detox",
          },
          default_workspace='juice_detox'
        }
      },
      ['core.qol.todo_items'] = {
        config = {
          create_todo_items = true,
          create_todo_parents = true,
        },
      },
      -- ['core.integrations.image'] = {},
      ['core.concealer'] = {
        config = {
          icons = {
            code_block = {
              conceal = true,
            },
          },
        }
      },
    }
  },
  dependencies = {
    'nvim-neorg/lua-utils.nvim',
    'nvim-lua/plenary.nvim',
    'lukas-reineke/headlines.nvim',
    'luarocks.nvim',
  },
  build = ':Neorg sync-parsers',
  keys = {
    { '<leader>ni', '<cmd>Neorg index<cr>',   desc = 'Open Index' },
    { '<leader>njt', '<cmd>Neorg journal today<cr>', desc = 'Open Today\'s Journal' },
    { '<leader>njy', '<cmd>Neorg journal today<cr>', desc = 'Open Yesterday\'s Journal' },
    { '<leader>nt', '<cmd>Neorg toc<cr>',     desc = 'TOC' },
    { '<leader>nc', '<cmd>Neorg journal custom<cr>',     desc = 'Open Calendar' },
  },
}
