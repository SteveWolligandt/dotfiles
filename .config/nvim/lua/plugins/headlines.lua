return {
  'lukas-reineke/headlines.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    norg = {
      fat_headlines = true,
      fat_headline_upper_string = "▄",
      fat_headline_lower_string = "▀",
    },
  },
}
