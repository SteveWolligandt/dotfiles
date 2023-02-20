vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

-- language
  use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
  use 'deoplete-plugins/deoplete-clang'
  use 'zchee/libclang-python3'
  use 'sbdchd/neoformat'
  use 'w0rp/ale'
  use 'lambdalisue/suda.vim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

-- airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

-- views
  use 'mbbill/undotree'
  use 'scrooloose/nerdtree'

-- misc
  use 'majutsushi/tagbar'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'

-- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

-- Debugging
  --use {'sakhnik/nvim-gdb',
  --     run=':!./install.sh',
  --     branch='devel'}
  use 'williamboman/mason.nvim'
  use {'mfussenegger/nvim-dap',
    requires = {
      "Pocco81/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      --"mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      'jay-babu/mason-nvim-dap.nvim',
      --{ "leoluz/nvim-dap-go", module = "dap-go" },
      --{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
    config = function()
      require("config.dap").setup()
    end,
  }

-- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'}
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use 'nvim-telescope/telescope-packer.nvim'

-- Syntax
  use 'cespare/vim-toml'
  use 'khaveesh/vim-fish-syntax'
  use 'tikhomirov/vim-glsl'
  use {'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'}

-- colorschemes
  use 'SteveWolligandt/vim-monokai'
  use 'patstockwell/vim-monokai-tasty'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'morhetz/gruvbox'
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/sonokai'


-- tmux
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'
  use 'mhinz/neovim-remote'

-- cmake
  use {'Shatur/neovim-cmake',
        requires = {'nvim-lua/plenary.nvim',
                    'mfussenegger/nvim-dap',
                    'mfussenegger/nvim-dap-python',}
      }

-- fortran
  use 'rudrab/vimf90'
  use 'SirVer/ultisnips'
  -- use 'neoclide/coc.nvim'

-- markdown
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'iamcco/markdown-preview.vim'
  
-- neorg
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    end
  }

  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.autocommands"] = {},
          ["core.export"] = {config={}},
          ["core.export.markdown"] = {config={}},
          ["core.integrations.treesitter"] = {config={}},
           --["core.norg.completion"] = {config = {engine="nvim-cmp"}},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                notes = "~\\neorg\\notes",
                gtd = "~\\neorg\\gtd",
              }
            }
          },
          ["core.gtd.base"] = {
            config = { workspace = "gtd" }
          },
          ["core.norg.qol.todo_items"] = {config = {}},
          ["core.norg.concealer"] = {config={}},
          ["core.keybinds"] = {
            config = {
              hook = function(keybinds)
                -- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
                keybinds.map("norg", "n", "<C-Space>", "core.norg.qol.todo_items.todo.task_done")
              end,
            }
          },
          ["core.presenter"] = {
            config = { zen_mode = "zen-mode" }
          }
        }
      }
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      --"rsh7th/nvim-cmp"
    }
  }

-- games
  use 'alec-gibson/nvim-tetris'
end)
