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
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup{}
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
  'kdheepak/lazygit.nvim',

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
      'folke/zen-mode.nvim',
      {
        'lukas-reineke/headlines.nvim',
        config = function()
          require("headlines").setup({
              norg = {
                query = vim.treesitter.query.parse(
                  "norg",
                  [[
                      [
                          (heading1_prefix)
                          (heading2_prefix)
                          (heading3_prefix)
                          (heading4_prefix)
                          (heading5_prefix)
                          (heading6_prefix)
                      ] @headline

                      (weak_paragraph_delimiter) @dash
                      (strong_paragraph_delimiter) @doubledash

                      ((ranged_tag
                          name: (tag_name) @_name
                          (#eq? @_name "code")
                      ) @codeblock (#offset! @codeblock 0 0 1 0))

                      (quote1_prefix) @quote
                  ]]
                ),
                headline_highlights = { "Headline" },
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash",
                dash_string = "-",
                doubledash_highlight = "DoubleDash",
                doubledash_string = "=",
                quote_highlight = "Quote",
                quote_string = "┃",
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
