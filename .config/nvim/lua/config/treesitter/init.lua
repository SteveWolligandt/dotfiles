local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'cpp', 'c', 'python', 'lua', 'java' },
    highlight = { enable = true, }
  }
end

return M
