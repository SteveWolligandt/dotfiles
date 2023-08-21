return {
  "nvim-neorg/neorg",
  config = function()
    require("config.neorg").setup()
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/zen-mode.nvim',
    'lukas-reineke/headlines.nvim',
  },
  build = ":Neorg sync-parsers",
}
