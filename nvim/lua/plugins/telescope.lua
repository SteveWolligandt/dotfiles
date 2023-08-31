return {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'rcarriga/nvim-notify',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
  },
  config = function()
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
    telescope.load_extension("notify")
  end,
  keys = {
    { '<leader>tf', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>te', '<cmd>Telescope <cr>', desc = 'Telescope'},
    { '<leader>tc', '<cmd>Telescope commands <cr>', desc = 'Neovim Commands'},
    { '<leader>tg', '<cmd>Telescope live_grep <cr>', desc = 'Grep'},
    { '<leader>tb', '<cmd>Telescope buffers <cr>', desc = 'Buffers'},
    { '<leader>tx', '<cmd>Telescope file_browser <cr>', desc = 'File Explorer'},
    { '<leader>tp', '<cmd>Telescope project <cr>', desc = 'Project'},
    { '<leader>th', '<cmd>Telescope help_tags <cr>', desc = 'Help Tags'},
    { '<leader>td', '<cmd>Telescope dap configurations <cr>', desc = 'DAP Configurations'},
  },
}
