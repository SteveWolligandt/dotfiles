local M = {}

local function configure()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {},
      ["core.autocommands"] = {},
      ["core.export"] = {config={}},
      ["core.export.markdown"] = {config={}},
      ["core.integrations.treesitter"] = {config={}},
      ["core.norg.completion"] = {config = {engine="nvim-cmp"}},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            notes = "~\\notes",
          },
          default = 'notes',
          open_last_workspace = true,
        }
      },
      ["core.norg.qol.todo_items"] = {config = {}},
      ["core.norg.esupports.hop"] = {config = {}},
      ["core.norg.concealer"] = {config={}},
      ["core.keybinds"] = {
        config = {}
      },
      ["core.presenter"] = {
        config = { zen_mode = "zen-mode" }
      }
    }
  }
end

function M.setup()
  configure()
end

return M
