local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local config = require 'config'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'sitiom/nvim-numbertoggle',
  {
    'sbdchd/neoformat',
    config = function()
      require('config').neoformat = require('config.neoformat')
      require('config').neoformat.setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({})
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('lualine').setup{}
    end
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
      require('barbar').setup{}
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      -- Move to previous/next
      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Magic buffer-picking mode
      map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
      -- Sort automatically by...
      map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
      map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
      map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
      map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

-- views
   {
     'mbbill/undotree',
     config = function()
       local map = vim.api.nvim_set_keymap
       local opts = { noremap = true, silent = true }
       map('n','<F3>', ':UndotreeToggle <CR>', opts)
     end
   },

 -- misc
  {
    'majutsushi/tagbar',
     config = function()
       local map = vim.api.nvim_set_keymap
       local opts = { noremap = true, silent = true }
       map('n', '<F4>', '<Cmd>TagbarToggle<CR>', opts)
     end
  },
-- misc
  {
    'easymotion/vim-easymotion',
    config = function()
      require('config.easymotion').setup()
    end,
  },

-- git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'tpope/vim-fugitive',
    config = function()
      require('config.fugitive').setup()
    end
  },
  {
    'kdheepak/lazygit.nvim',
    config = function()
     vim.g.lazygit_floating_window_scaling_factor = 1.0
     vim.g.lazygit_floating_window_winblend = 0
    end,
  },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup{}
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

-- Mason
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      require("mason").setup()
      local lsps = { 'lua_ls', 'jdtls', 'texlab' }
      if vim.fn.executable('npm') == 1 then
        table.insert(lsps, 'pyright')
        table.insert(lsps, 'tsserver')
      end
      if vim.fn.executable('go') == 1 then
        table.insert(lsps, 'gopls')
      end
      require("mason-lspconfig").setup{
        ensure_installed = lsps,
      }
      require("mason-nvim-dap").setup{
        ensure_installed = { 'cppdbg'},
      }
    end,
  },

-- Debugging
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require("config.dap").setup()
    end,
  },

-- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-project.nvim',
      {'stevearc/dressing.nvim', 
        config = function()
          require("config.dressing").setup()
        end},
      'nvim-telescope/telescope-dap.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
    },
    config = function()
      require("config.telescope").setup()
    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {
      strategy = 'toggleterm',
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require("toggleterm").setup{
        open_mapping=[[<C-\>]],
        direction='float',
        --shell="zsh",
        shell="fish",
      }
    end
  },
  -- {
  -- 'EthanJWright/vs-tasks.nvim',
  -- dependencies = {
  --   'nvim-lua/popup.nvim',
  --   'nvim-lua/plenary.nvim',
  --   'nvim-telescope/telescope.nvim',
  -- },
  --   config = function()
  --     require('vstask').setup{
  --       cache_json_conf=false,
  --       terminal = 'toggleterm',
  --       config_dir = ".",
  --       term_opts = {
  --         current = {
  --           direction = "float",
  --         },
  --         vertical = {
  --           direction = "vertical",
  --           size = "80"
  --         },
  --         horizontal = {
  --           direction = "horizontal",
  --           size = "30"
  --         },
  --         tab = {
  --           direction = 'tab',
  --         }
  --       },
  --     }
  --   end
  -- },

-- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
     require("config.treesitter").setup()
    end
  },

-- Color Schemes

  {
    'sainnhe/sonokai',
    config = function()
        vim.cmd('syntax enable')
        -- vim.cmd('colorscheme sonokai')
    end,
  },
  {
    'NTBBloodbath/doom-one.nvim',
    setup = function()
        -- Add color to cursor
        vim.g.doom_one_cursor_coloring = false
        -- Set :terminal colors
        vim.g.doom_one_terminal_colors = true
        -- Enable italic comments
        vim.g.doom_one_italic_comments = false
        -- Enable TS support
        vim.g.doom_one_enable_treesitter = true
        -- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = false
        -- Enable transparent background
        vim.g.doom_one_transparent_background = false

        -- Pumblend transparency
        vim.g.doom_one_pumblend_enable = false
        vim.g.doom_one_pumblend_transparency = 20

        -- Plugins integration
        vim.g.doom_one_plugin_neorg = true
        vim.g.doom_one_plugin_barbar = false
        vim.g.doom_one_plugin_telescope = false
        vim.g.doom_one_plugin_neogit = true
        vim.g.doom_one_plugin_nvim_tree = true
        vim.g.doom_one_plugin_dashboard = true
        vim.g.doom_one_plugin_startify = true
        vim.g.doom_one_plugin_whichkey = true
        vim.g.doom_one_plugin_indent_blankline = true
        vim.g.doom_one_plugin_vim_illuminate = true
        vim.g.doom_one_plugin_lspsaga = false
    end,
    config = function()
        vim.cmd('syntax enable')
        vim.cmd('colorscheme doom-one')
    end,
  },

  {
    'hrsh7th/nvim-cmp', 
    -- config = function()
    --   require("config.nvim-cmp").setup()
    -- end,
  },

  {
   'neovim/nvim-lspconfig',
    config = function()
      config.lsp = require("config.lsp")
      config.lsp.setup()
    end,
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'mfussenegger/nvim-jdtls',
      'p00f/clangd_extensions.nvim',
      'L3MON4D3/LuaSnip',
      'folke/neodev.nvim'
    },
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
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
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require("config.neorg").setup()
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/zen-mode.nvim',
      {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
          require("headlines").setup({
              norg = {
                fat_headlines = true,
                fat_headline_upper_string = "▄",
                fat_headline_lower_string = "▀"
            }
          })
        end
      },
    },
    build = ":Neorg sync-parsers",
  },

-- markdown
  'godlygeek/tabular',
  'plasticboy/vim-markdown',
  'iamcco/markdown-preview.vim',

-- cmake
  {
    'Shatur/neovim-cmake',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },

-- tmux
  'tmux-plugins/vim-tmux-focus-events',
  'roxma/vim-tmux-clipboard',
  'christoomey/vim-tmux-navigator',
  'mhinz/neovim-remote',

-- Latex
  -- 'lervag/vimtex',

-- games
  'alec-gibson/nvim-tetris',
}
require("lazy").setup(plugins)
