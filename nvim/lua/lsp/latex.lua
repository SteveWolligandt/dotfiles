local M = {}
local lspconfig = require 'lspconfig'
local cmp_nvim_lsp = require "cmp_nvim_lsp"
--------------------------------------------------------------------------------
function M.setup()
  lspconfig.texlab.setup{
    on_attach = require('lsp').on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
  }
end
--------------------------------------------------------------------------------
return M
