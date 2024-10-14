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
      headline_highlights = { 'Headline1', 'Headline2', 'Headline3', 'Headline4' },
    },
  },
  setup = function(_, opts)
    require'headlines'.setup(opts)
    vim.cmd [[highlight Headline1 guibg=#3A5F75]]
    vim.cmd [[highlight Headline2 guibg=#2F3E5E]]
    vim.cmd [[highlight Headline3 guibg=#663F28]]
    vim.cmd [[highlight Headline4 guibg=#334222]]
  end,
}
