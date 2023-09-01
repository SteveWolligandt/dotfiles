local M = {}

function M.setup()
  local dap = require('dap')
  dap.adapters.cppdbg = {
    name = 'cppdbg',
    type = 'executable',
    command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "cppdbg",
      request = "launch",
      program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = true,
    },
  }
  dap.configurations.h = dap.configurations.cpp
end

return M
