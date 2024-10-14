local M = {}
--------------------------------------------------------------------------------
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(_, bufnr)
  local whichkey = require 'which-key'

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  whichkey.add({
    { 'g', group = 'Go to...', nowait = false, remap = false },
    { 'gD', function() vim.lsp.buf.declaration() end, desc = 'Go to declaration', nowait = false, remap = false },
    { 'gd', function() vim.lsp.buf.definition() end, desc = 'Go to definition', nowait = false, remap = false },
    { 'gh', function() vim.lsp.buf.hover() end, desc = 'Hover', nowait = false, remap = false },
    { 'gi', function() vim.lsp.buf.implementation() end, desc = 'Go to implementation', nowait = false, remap = false },
    { 'gt', function() vim.lsp.buf.type_definition() end, desc = 'Go to type definition', nowait = false, remap = false },
  })
  whichkey.add({
    { '<space>', group = 'LSP', nowait = false, remap = false },
    { '<space>ca', function() vim.lsp.buf.code_action() end, desc = 'Code Action', nowait = false, remap = false },
    { '<space>f',  function() vim.lsp.buf.formatting() end, desc = 'Formatting', nowait = false, remap = false },
    { '<space>k',  function() vim.lsp.buf.signature_help() end, desc = 'Signature Help', nowait = false, remap = false },
    { '<space>q',  function() vim.diagnostic.setloclist() end, desc = 'Set Loc List', nowait = false, remap = false },
    { '<space>r',  function() vim.lsp.buf.rename() end, desc = 'Refactor Name', nowait = false, remap = false },
    { '<space>w', group = 'Workspace', nowait = false, remap = false },
    { '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, desc = 'Add workspace folder', nowait = false, remap = false },
    { '<space>wl', function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = 'List workspace folders', nowait = false, remap = false },
    { '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, desc = 'Remove workspace folder', nowait = false, remap = false },
  })
end
--------------------------------------------------------------------------------
return M
