return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {'Shougo/deoplete.nvim',  run = ':UpdateRemotePlugins' }
  use 'deoplete-plugins/deoplete-clang'
  use 'zchee/libclang-python3'
  use 'w0rp/ale'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'rhysd/vim-clang-format'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'easymotion/vim-easymotion'
  use 'SteveWolligandt/vim-monokai'
  use 'lervag/vimtex'
  use 'majutsushi/tagbar'
  use 'tpope/vim-surround'
  use 'scrooloose/nerdtree'
  use 'mhinz/neovim-remote'
  use {'Shatur/neovim-cmake',
        requires = {'nvim-lua/plenary.nvim',
                    'mfussenegger/nvim-dap'}
      }
  use {'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'}

-- Syntax
  use 'cespare/vim-toml'
  use 'khaveesh/vim-fish-syntax'
  use 'tikhomirov/vim-glsl'

-- tmux
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'

--Fortran
  use 'rudrab/vimf90'
  use 'SirVer/ultisnips'
  -- use 'neoclide/coc.nvim'

--Markdown
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'iamcco/markdown-preview.vim'

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
                 uni = "~\\notes\\uni",
                 home = "~\\notes\\home",
                 ascent = "~\\notes\\ascent",
               }
             }
           },
           ["core.norg.concealer"] = {config={}},
           ["core.keybinds"] = {
             config = {
               hook = function(keybinds)
                 -- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
                 keybinds.map("norg", "n", "<C-Space>", "core.norg.qol.todo_items.todo.task_done")
               end,
             }
           }
         }
       }
     end,
     requires = {
       "nvim-lua/plenary.nvim",
       --"rsh7th/nvim-cmp"
     }
end)
