return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'cpp', 'c', 'python', 'lua', 'java', 'bash', 'vimdoc', 'regex' },
      highlight = { enable = true, }
    }
  end
}
