local M = {}

local function configure()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {},
      ["core.autocommands"] = {},
      ["core.export"] = {config={}},
      ["core.export.markdown"] = {config={}},
      ["core.integrations.treesitter"] = {config={}},
      -- ["core.completion"] = {config = {engine="nvim-cmp"}},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace='notes'
        }
      },
      ["core.qol.todo_items"] = {config = {}},
      ["core.esupports.hop"] = {config = {}},
      ["core.concealer"] = {config={}},
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
  require('config.neorg.keymaps').setup()
end

return M
