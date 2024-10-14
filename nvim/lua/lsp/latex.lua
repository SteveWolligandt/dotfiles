local M = {}
--------------------------------------------------------------------------------
local lsp          = require 'lsp'
local lspconfig    = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
--------------------------------------------------------------------------------
local mason_path  = vim.fs.joinpath(vim.fn.stdpath('data'), 'mason')
local mason_bin_path = vim.fs.joinpath(mason_path, 'bin')
local texlab_cmd = vim.fs.joinpath(mason_bin_path, 'texlab')
--------------------------------------------------------------------------------
function M.setup()
  lspconfig.texlab.setup{
    cmd          = { texlab_cmd },
    on_attach    = lsp.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
  }
end
--------------------------------------------------------------------------------
return M
