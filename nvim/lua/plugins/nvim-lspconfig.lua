return {
 'neovim/nvim-lspconfig',
  config = function()
    require('lsp').setup()
  end,
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'mfussenegger/nvim-jdtls',
    'p00f/clangd_extensions.nvim',
    'L3MON4D3/LuaSnip',
    'folke/neodev.nvim'
  },
}
