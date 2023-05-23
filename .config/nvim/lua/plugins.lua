local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
  {
    'sbdchd/neoformat',
    config = function()
      require('config.neoformat').setup()
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
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup()
    end
  },

  {
    'alvarosevilla95/luatab.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('luatab').setup{} 
    end
  },

-- views
  'mbbill/undotree',

-- misc
  'majutsushi/tagbar',
  {
    'easymotion/vim-easymotion',
    config = function()
      require('config.easymotion').setup()
    end,
  },

-- git
  {
    'tpope/vim-fugitive',
    config = function()
      require('config.fugitive').setup()
    end
  },
  'airblade/vim-gitgutter',

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
      local lsps = { 'lua_ls', 'jdtls', 'pyright', 'tsserver', 'texlab' }
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
      {
        'EthanJWright/vs-tasks.nvim',
        dependencies = {
          'nvim-lua/popup.nvim',
        }
      },
    },
    config = function()
      require("config.telescope").setup()
    end,
  },

-- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
     require("config.treesitter").setup()
    end
  },

-- Color Schemes
  'sainnhe/sonokai',
  -- add more if you want

  {
    'hrsh7th/nvim-cmp', 
    -- config = function()
    --   require("config.nvim-cmp").setup()
    -- end,
  },

  {
   'neovim/nvim-lspconfig',
    config = function()
      require("config.lsp").setup()
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
    "startup-nvim/startup.nvim",
    config = function()
      require('startup').setup({theme = "startify"})
    end
  },

  {
    "nvim-neorg/neorg",
    config = function()
      require("config.neorg").setup()
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
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
