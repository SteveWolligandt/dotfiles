local M = {}

local function configure()
  require('neorg').setup {
    load = {
      ['core.defaults'] = {},
      ['core.neorgcmd'] = {},
      ['core.summary'] = {},
      ['core.journal'] = {},
      ['core.autocommands'] = {},
      ['core.export'] = {config={}},
      ['core.export.markdown'] = {config={}},
      ['core.integrations.treesitter'] = {config={}},
      -- ['core.completion'] = {config = {engine='nvim-cmp'}},
      -- ['core.tempus'] = {},
      -- ['core.manoeuvre'] = {},
      -- ['core.ui.calendar'] = {},
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
      ['core.esupports.hop'] = {
        config = {}
      },
      ['core.concealer'] = {
        config={
          icons={
            code_block = {
              conceal=true,
            },
          },
        }
      },
      ['core.keybinds'] = {
        config = {}
      },
      ['core.presenter'] = {
        config = { zen_mode = 'zen-mode' }
      }
    }
  }
end

function M.setup()
  configure()
  require('config.neorg.keymaps').setup()
end

return M
