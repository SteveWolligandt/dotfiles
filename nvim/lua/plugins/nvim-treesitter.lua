return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
   require("config.treesitter").setup()
  end
}
