local M            = {}
local lspconfig    = require 'lspconfig'
local neodev       = require 'neodev'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
--------------------------------------------------------------------------------
function M.setup()
  neodev.setup{}

  lspconfig.lua_ls.setup{
    settings = {
      Lua = {
        -- runtime = {
        --   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --   version = 'LuaJIT',
        -- },
        workspace = {
        --   -- Make the server aware of Neovim runtime files
        --   library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
        completion = {
          callSnippet = "Replace"
        },
      },
    },
    on_attach = require 'config.lsp'.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
  }
end
--------------------------------------------------------------------------------
return M
