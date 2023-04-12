local M = {}

function M.setup()
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'cpp', 'c', 'python', 'lua', 'java' },
    highlight = { enable = true, }
  }
end

return M
