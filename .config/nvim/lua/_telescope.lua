require('telescope').setup{
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
    packer = {
      theme = "ivy",
      layout_config = {
        height = .5
      }
    },
    dap = {},
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("packer")
require("telescope").load_extension("ui-select")
require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')
