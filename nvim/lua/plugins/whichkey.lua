return {
  'folke/which-key.nvim',
  lazy = false,
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
}
