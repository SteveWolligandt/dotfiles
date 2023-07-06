local M            = {}
local lspconfig    = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local config       = require 'config'
--------------------------------------------------------------------------------
function M.setup()
  lspconfig.pyright.setup{
    on_attach    = config.lsp.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
  }
end
--------------------------------------------------------------------------------
return M
