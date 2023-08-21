local M = {}

function M.setup()
  local telescope = require('telescope')
  telescope.setup{
    defaults = {
      mappings = {
        i = {}
      }
    },
    pickers = { },
    extensions = {
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
          },
          ["n"] = {
            -- your custom normal mode mappings
          },
        },
      },
      dap = {},
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },
    }
  }

  telescope.load_extension('fzf')
  telescope.load_extension('dap')
  telescope.load_extension('file_browser')
  telescope.load_extension('project')

  require("config.telescope.keymaps").setup() -- Keymaps
end

return M