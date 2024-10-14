return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'cpp',
      'c',
      'python',
      'lua',
      'java',
      'bash',
      'vimdoc',
      'regex',
      'html',
      'http',
    },
    highlight = {
      enable = false,
    }
  },
  enabled = true,
}
