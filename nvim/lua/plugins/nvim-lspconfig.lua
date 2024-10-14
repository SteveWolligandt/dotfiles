return {
 'neovim/nvim-lspconfig',

  config = function()
    local lsps = {
      require 'lsp.cpp',
      require 'lsp.python',
      require 'lsp.lua',
      require 'lsp.typescript',
      require 'lsp.golang',
      require 'lsp.latex',
    }

    local whichkey = require 'which-key'
    local luasnip  = require 'luasnip'
    local cmp      = require 'cmp'
    local clangd_extensions = {
      cmp_scores = require 'clangd_extensions.cmp_scores',
    }
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    whichkey.add({
      { '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', desc = 'Open Float', nowait = false, remap = false },
      { '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', desc = 'Set Loc List', nowait = false, remap = false },
    })

    for _,lsp in ipairs(lsps) do
      lsp.setup()
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
  end,

  dependencies = {
    'L3MON4D3/LuaSnip',
    'folke/lazydev.nvim',
    'folke/which-key.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'mfussenegger/nvim-jdtls',
    'p00f/clangd_extensions.nvim',
    'williamboman/mason.nvim',
  },
}
