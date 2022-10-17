return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
  use 'deoplete-plugins/deoplete-clang'
  use 'zchee/libclang-python3'
  use 'w0rp/ale'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'}
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use 'sbdchd/neoformat'
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

--Markdown
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'iamcco/markdown-preview.vim'
end)
