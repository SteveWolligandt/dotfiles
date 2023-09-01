local M = {}
function M.setup() 
  local dap = require('dap')

  dap.configurations.lua = {
    {
      name = 'Current file (local-lua-dbg, lua)',
      type = 'local-lua',
      request = 'launch',
      cwd = '${workspaceFolder}',
      program = {
        lua = 'lua5.1',
        file = '${file}',
      },
      args = {},
    },
  }
end
return M
