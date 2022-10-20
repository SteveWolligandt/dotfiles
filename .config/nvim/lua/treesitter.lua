local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'norg', 'haskell', 'cpp', 'c', 'javascript', 'markdown', 'python' },
  highlight = { enable = true, }
}
