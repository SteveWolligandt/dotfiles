return {
  'folke/tokyonight.nvim',
  lazy = false,
  config = function()
      vim.cmd('syntax enable')
      vim.cmd('colorscheme tokyonight-storm')
  end,
}
