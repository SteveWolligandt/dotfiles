return {
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
}
