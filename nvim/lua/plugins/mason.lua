return {
  'williamboman/mason.nvim',

  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },

  config = function()
    local mason     = require 'mason'
    local lspconfig = require 'mason-lspconfig'
    local dapconfig = require 'mason-nvim-dap'
    mason.setup()
    local lsps = { 'lua_ls', 'jdtls', 'texlab' }
    local daps = { 'cppdbg' }
    if vim.fn.executable('npm') == 1 then
      table.insert(lsps, 'pyright')
      table.insert(lsps, 'tsserver')
    end
    if vim.fn.executable('go') == 1 then
      table.insert(lsps, 'gopls')
    end

    lspconfig.setup{ ensure_installed = lsps }
    dapconfig.setup{ ensure_installed = daps }
  end,
}
