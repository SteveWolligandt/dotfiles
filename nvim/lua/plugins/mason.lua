return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  opts = {},
  config = function()
    require("mason").setup()
    local lsps = { 'lua_ls', 'jdtls', 'texlab' }
    if vim.fn.executable('npm') == 1 then
      table.insert(lsps, 'pyright')
      table.insert(lsps, 'tsserver')
    end
    if vim.fn.executable('go') == 1 then
      table.insert(lsps, 'gopls')
    end
    require("mason-lspconfig").setup{
      ensure_installed = lsps,
    }
    require("mason-nvim-dap").setup{
      ensure_installed = { 'cppdbg'},
    }
  end,
}
