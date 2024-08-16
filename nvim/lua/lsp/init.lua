local M = {}
local whichkey = require 'which-key'
local luasnip  = require 'luasnip'
local cmp      = require 'cmp'
local clangd_extensions = {
  cmp_scores = require("clangd_extensions.cmp_scores"),
}

--------------------------------------------------------------------------------
function M.setup()
  M.cpp        = require 'lsp.cpp'
  M.python     = require 'lsp.python'
  M.lua        = require 'lsp.lua'
  M.typescript = require 'lsp.typescript'
  M.golang     = require 'lsp.golang'
  M.latex      = require 'lsp.latex'
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  whichkey.add({
    { "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float", nowait = false, remap = false },
    { "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Set Loc List", nowait = false, remap = false },
  })

  M.cpp.setup()
  M.python.setup()
  M.typescript.setup()
  M.golang.setup()
  M.latex.setup()
  if vim.fn.executable('lua-language-server') == 1 then
    M.lua.setup()
  end

  -- nvim-cmp setup
  cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
      end, {'i','s'}),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
      end, {'i','s'}),
    }),
    sources = {
      {name = 'nvim_lsp'},
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.recently_used,
        clangd_extensions.cmp_scores,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  }
end
--------------------------------------------------------------------------------
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  whichkey.add({
    { "g", group = "Go to...", nowait = false, remap = false },
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration", nowait = false, remap = false },
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition", nowait = false, remap = false },
    { "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover", nowait = false, remap = false },
    { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation", nowait = false, remap = false },
    { "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition", nowait = false, remap = false },
  })
  whichkey.add({
    { "<space>", group = "LSP", nowait = false, remap = false },
    { "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action", nowait = false, remap = false },
    { "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", desc = "Formatting", nowait = false, remap = false },
    { "<space>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help", nowait = false, remap = false },
    { "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Set Loc List", nowait = false, remap = false },
    { "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Refactor Name", nowait = false, remap = false },
    { "<space>w", group = "Workspace", nowait = false, remap = false },
    { "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add workspace folder", nowait = false, remap = false },
    { "<space>wl", "<cmd>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List workspace folders", nowait = false, remap = false },
    { "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove workspace folder", nowait = false, remap = false },
  })
end
--------------------------------------------------------------------------------
return M
