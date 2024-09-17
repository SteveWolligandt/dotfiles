local M = {}
--------------------------------------------------------------------------------
local lsp          = require 'lsp'
local lspconfig    = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
--------------------------------------------------------------------------------
function M.setup()
  lspconfig.texlab.setup{
    on_attach = lsp.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
  }
end
--------------------------------------------------------------------------------
return M
