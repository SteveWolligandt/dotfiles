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
      require('Comment').setup({padding = false})
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

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

-- Debugging
  --use {'sakhnik/nvim-gdb',
  --     run=':!./install.sh',
  --     branch='devel'}
  use 'williamboman/mason.nvim'
  use {'mfussenegger/nvim-dap',
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "ldelossa/nvim-dap-projects",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      require("config.dap").setup()
    end,
  }

-- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-packer.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      }
    },
    config = function()
      require("config.telescope").setup()
    end,
  }

-- Latex
  use 'lervag/vimtex'

-- Syntax
  use 'cespare/vim-toml'
  use 'khaveesh/vim-fish-syntax'
  use 'tikhomirov/vim-glsl'
  use {'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate',
       config = function()
        require("config.treesitter").setup()
       end}

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

---- fortran
--  use 'rudrab/vimf90'
--  use 'SirVer/ultisnips'
--  -- use 'neoclide/coc.nvim'
--
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
      require("config.neorg").setup()
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      {'hrsh7th/nvim-cmp', 
        config = function()
          require("config.nvim-cmp").setup()
        end,
      }
    }
  }

-- games
  use 'alec-gibson/nvim-tetris'
end)
