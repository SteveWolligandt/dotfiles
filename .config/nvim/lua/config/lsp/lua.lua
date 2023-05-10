local M = {}
local lspconfig = require 'lspconfig'
--------------------------------------------------------------------------------
function M.setup()
  require("neodev").setup{}
  lspconfig.lua_ls.setup{
    on_attach = require'config.lsp'.on_attach,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  }
end
--------------------------------------------------------------------------------
return M
