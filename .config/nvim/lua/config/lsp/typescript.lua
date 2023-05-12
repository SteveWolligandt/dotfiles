local M = {}
local lspconfig = require 'lspconfig'
--------------------------------------------------------------------------------
function M.setup()
  lspconfig.tsserver.setup {
    on_attach = require'config.lsp'.on_attach,
  }
end
--------------------------------------------------------------------------------
return M
