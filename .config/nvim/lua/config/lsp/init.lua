local M = {}
local whichkey = require 'which-key'
local luasnip = require 'luasnip'
--------------------------------------------------------------------------------
function M.setup()
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  whichkey.register({
      e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open Float' },
      q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Set Loc List' },
    },
    {
      mode = "n",
      prefix = "<space>",
      silent = true,
      noremap = true,
      nowait = false,
    })

  require('config.lsp.cpp').setup()
  require('config.lsp.python').setup()
  require('config.lsp.lua').setup()
  require('config.lsp.typescript').setup()
  require('config.lsp.golang').setup()

  -- nvim-cmp setup
  local cmp = require 'cmp'
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
        require("clangd_extensions.cmp_scores"),
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
  whichkey.register({
    name = 'LSP',
      g = {
        name = "Go to...",
        D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
        d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go to type definition' },
        r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Go to reference' },
        i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
      },
      q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Set Loc List' },
      h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
      k = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
      w = {name = 'Workspace',
        a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add workspace folder'},
        r = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove workspace folder'},
        l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspace folders'},
      },
      r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Refactor Name'},
      c = {
        a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action'},
      },
      f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Formatting'},
    },
    {
      mode = "n",
      prefix = "<space>",
      silent = true,
      noremap = true,
      nowait = false,
    })
end
--------------------------------------------------------------------------------
return M
