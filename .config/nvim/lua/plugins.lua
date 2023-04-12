vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'sbdchd/neoformat',
    config = function()
      require('config.neoformat').setup()
    end,
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({})
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup()
    end
  }
  use {
    'alvarosevilla95/luatab.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('luatab').setup{} 
    end
  }

-- views
  use 'mbbill/undotree'

-- misc
  use 'majutsushi/tagbar'
  use {
    'easymotion/vim-easymotion',
    config = function()
      require('config.easymotion').setup()
    end,
  }

-- git
  use {
    'tpope/vim-fugitive',
    config = function()
      require('config.fugitive').setup()
    end
  }
  use 'airblade/vim-gitgutter'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup{}
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

-- Debugging
  use 'williamboman/mason.nvim'
  use {'mfussenegger/nvim-dap',
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
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
      {'stevearc/dressing.nvim', 
        config = function()
          require("config.dressing").setup()
        end},
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-packer.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
      {
        'EthanJWright/vs-tasks.nvim',
        requires = {
          'nvim-lua/popup.nvim',
        }
      },
    },
    config = function()
      require("config.telescope").setup()
    end,
  }

-- Syntax
  use {'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate',
       config = function()
        require("config.treesitter").setup()
       end}

-- colorschemes
  use 'sainnhe/sonokai'
  -- add more if you want

  use {
   'neovim/nvim-lspconfig',
    config = function()
      require("config.lsp").setup()
    end,
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'mfussenegger/nvim-jdtls',
      'p00f/clangd_extensions.nvim',
      'L3MON4D3/LuaSnip',
    },
  }

  use {
    "startup-nvim/startup.nvim",
    config = function()
      require('startup').setup({theme = "startify"})
    end
  }


  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    },
    config = function()
      vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end,
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

-- markdown
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'iamcco/markdown-preview.vim'

-- cmake
  use {
    'Shatur/neovim-cmake',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
    }
  }

-- tmux
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'
  use 'mhinz/neovim-remote'

-- Latex
  use 'lervag/vimtex'

-- games
  use 'alec-gibson/nvim-tetris'
end)
