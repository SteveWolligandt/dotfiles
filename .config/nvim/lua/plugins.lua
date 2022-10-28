vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

-- Language
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

-- Airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

-- Views
  use 'mbbill/undotree'
  use 'scrooloose/nerdtree'

  use 'majutsushi/tagbar'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'

-- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

-- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'}
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use 'nvim-telescope/telescope-packer.nvim'

-- Latex
  use 'lervag/vimtex'

-- Syntax
  use 'cespare/vim-toml'
  use 'khaveesh/vim-fish-syntax'
  use 'tikhomirov/vim-glsl'
  use {'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'}
  use 'SteveWolligandt/vim-monokai'

-- tmux
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'
  use 'mhinz/neovim-remote'

-- CMake
  use {'Shatur/neovim-cmake',
        requires = {'nvim-lua/plenary.nvim',
                    'mfussenegger/nvim-dap',
                    'mfussenegger/nvim-dap-python',}
      }

--Fortran
  use 'rudrab/vimf90'
  use 'SirVer/ultisnips'
  -- use 'neoclide/coc.nvim'

--Markdown
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'iamcco/markdown-preview.vim'
  
-- Neorg
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
-- Games
  use 'alec-gibson/nvim-tetris'
end)
