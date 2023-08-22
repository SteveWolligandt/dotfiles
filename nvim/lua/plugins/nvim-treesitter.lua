return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'cpp', 'c', 'python', 'lua', 'java', 'bash' },
      highlight = { enable = true, }
    }
  end
}
