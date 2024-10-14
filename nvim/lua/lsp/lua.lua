local M = {}
--------------------------------------------------------------------------------
function M.setup()
  local mason_registry = require 'mason-registry'
  if not mason_registry.is_installed('lua-language-server') then
    vim.notify('lua-language-server not found', 'error', {title = 'lsp'})
    return
  end

  local luals_cmd = vim.fs.joinpath(vim.fn.stdpath('data'), 'mason', 'bin', 'lua-language-server')

  local lsp            = require 'lsp'
  local cmp_nvim_lsp   = require 'cmp_nvim_lsp'
  local lspconfig      = require 'lspconfig'

  lspconfig.lua_ls.setup {
    cmd = { luals_cmd },
    settings = {
      Lua = {
        -- runtime = {
        --   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --   version = 'LuaJIT',
        -- },
        workspace = {
        -- Make the server aware of Neovim runtime files
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
    on_attach = lsp.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
  }
end
--------------------------------------------------------------------------------
return M
